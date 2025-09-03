//
//  ContentView.swift
//  Subzillo
//
//  Created by KSMACMINI-019 on 01/09/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                LottieView(name: "splash")
                                .frame(width: 200, height: 200)
                
                Button("Show Loader") {
//                    LoaderManager.shared.showLoader(text: "loading")
                    AlertManager.shared.showAlert(
                                        title: "Info",
                                        message: "This is a global info alert."
                                    )
                }
                
                Button("Show Toast") {
                    AlertManager.shared.showAlert(
                        title: "Logout",
                        message: "Are you sure you want to log out?",
                        okText: "Logout",
                        cancelText: "Cancel",
                        okAction: { print("Logged out") },
                        cancelAction: { print("Canceled") }
                    )
//                    ToastManager.shared.show("Hello, this is a toast! 🎉")
                }
                
                Button("show alertt"){
                    AlertManager.shared.showAlert(
                        title: "Delete",
                        message: "This action cannot be undone.",
                        okText: "Delete",
                        cancelText: "Cancel",
                        isDestructive: true,
                        okAction: { print("Deleted!") }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
