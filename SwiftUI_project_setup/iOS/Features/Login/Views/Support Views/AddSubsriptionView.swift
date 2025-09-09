//
//  AddSubsriptionView.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 08/09/25.
//

import SwiftUI

        struct AddSubsriptionView1: View {
            @State private var showModal = true
            var body: some View {
                ZStack(alignment: .bottom) {
                    Color.gray.opacity(0.10).ignoresSafeArea()
                    
                    if showModal {
                        CurvedModalAdaptiveView()
                            .transition(.move(edge: .bottom))
                    }
                    
//                    HStack {
//                        Spacer()
//                        Button(action: {}) {
//                            Image(systemName: "plus")
//                                .foregroundColor(.white)
//                                .font(.system(size: 28, weight: .bold))
//                                .frame(width: 60, height: 60)
//                                .background(
//                                    Circle()
//                                        .fill(LinearGradient(
//                                            colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)],
//                                            startPoint: .topLeading,
//                                            endPoint: .bottomTrailing
//                                        ))
//                                        .shadow(radius: 8)
//                                )
//                                .padding(.bottom, 10)
//                        }
//                        Spacer()
//                    }
//                    .background(
//                        BlurView(style: .systemMaterial)
//                            .frame(height: 64)
//                            .cornerRadius(26)
//                            .padding(.horizontal, 30)
//                    )
//                    .padding(.bottom, 8)
                }
            }
        }

#Preview {
    AddSubsriptionView1()
}


struct SubscriptionOption: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let iconColor: Color
    let bgColor: Color
    let label: String?
    let labelColor: Color?
}

let options = [
    SubscriptionOption(
        title: "Manual Entry",
        description: "Add subscription details manually",
        icon: "pencil",
        iconColor: .blue,
        bgColor: Color.blue.opacity(0.1),
        label: nil,
        labelColor: nil
    ),
    SubscriptionOption(
        title: "Voice Command",
        description: "Add subscription using your voice",
        icon: "mic.fill",
        iconColor: .green,
        bgColor: Color.green.opacity(0.1),
        label: nil,
        labelColor: nil
    ),
    SubscriptionOption(
        title: "Upload Screenshot",
        description: "Upload a screenshot of your subscription",
        icon: "photo.on.rectangle",
        iconColor: .orange,
        bgColor: Color.orange.opacity(0.1),
        label: nil,
        labelColor: nil
    ),
    SubscriptionOption(
        title: "Upload Bank Statement",
        description: "Upload bank statement to extract subscription",
        icon: "doc.fill",
        iconColor: .purple,
        bgColor: Color.purple.opacity(0.1),
        label: "Coming soon",
        labelColor: .purple
    ),
    SubscriptionOption(
        title: "Email Integration",
        description: "Connect your email to find subscriptions",
        icon: "envelope.fill",
        iconColor: .pink,
        bgColor: Color.pink.opacity(0.1),
        label: nil,
        labelColor: nil
    )
]

struct CurvedModalAdaptiveView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Content here (e.g., your list of options)
            Text("Add Subscription")
                .font(.headline)
                .padding(.top, 24)

            Text("Choose how you’d like to add your subscription")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom, 14)
            
            // Example dynamic content
            ForEach(0..<5) { i in
                HStack {
                    Circle().fill(Color.blue.opacity(0.2)).frame(width: 36, height: 36)
                        .overlay(Image(systemName: "pencil").foregroundColor(.blue))
                    VStack(alignment: .leading) {
                        Text("Option \(i + 1)").fontWeight(.semibold)
                        Text("Description for option \(i + 1)").font(.caption)
                    }
                    Spacer()
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.gray.opacity(0.2))
                        .background(RoundedRectangle(cornerRadius: 13).fill(Color.white))
                )
                .padding(.horizontal)
                .padding(.vertical, 2)
            }
            
            Spacer(minLength: 8)
        }
        .padding(.vertical, 22)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.06), radius: 12, y: 3)
        )
        .padding(.horizontal, 20)
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
