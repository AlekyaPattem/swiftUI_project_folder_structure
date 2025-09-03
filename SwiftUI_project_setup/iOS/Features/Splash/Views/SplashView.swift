//
//  SplashView.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 02/09/25.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
        
        var body: some View {
            ZStack {
                if self.isActive {
                    ContentView()
                } else {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

#Preview {
    SplashView()
}
