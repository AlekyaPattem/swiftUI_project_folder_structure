//
//  ToastManager.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 03/09/25.
//

import SwiftUI


final class ToastManager: ObservableObject {
    static let shared = ToastManager()
    
    @Published var message: String = ""
    @Published var isShowing: Bool = false
    
    private var hideTask: Task<Void, Never>?
    
    func show(_ message: String, duration: TimeInterval = 2.0) {
        self.message = message
        self.isShowing = true
        
        // Cancel any existing hide task
        hideTask?.cancel()
        
        // Hide after delay
        hideTask = Task {
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            await MainActor.run {
                withAnimation(.easeInOut(duration: 0.4)) {
                    self.isShowing = false
                }
            }
        }
    }
    
    func hide() {
        hideTask?.cancel()
        withAnimation(.easeInOut(duration: 0.4)) {
            self.isShowing = false
        }
    }
}

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.8))
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding(.bottom, 30)
    }
}

private struct ToastModifier: ViewModifier {
    @ObservedObject var toast = ToastManager.shared
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if toast.isShowing {
                VStack {
                    Spacer()
                    ToastView(message: toast.message)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .zIndex(1) // ensure it overlays
            }
        }
    }
}

extension View {
    func withToast() -> some View {
        self.modifier(ToastModifier())
    }
}

