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
                    LoaderManager.shared.showLoader(text: "loading")
                }
                
                Button("Show Toast") {
                    ToastManager.shared.show("Hello, this is a toast! 🎉")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
