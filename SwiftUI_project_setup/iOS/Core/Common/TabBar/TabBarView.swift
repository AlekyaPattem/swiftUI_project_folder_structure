//
//  TabBarView.swift
//  SwiftUI_project_setup
//
//  Created by swathipriya pattem on 03/09/25.
//

import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, box, add, stats, history
    }
    
    var body: some View {
        ZStack {
            // Main content view
            VStack {
                Spacer()
                tabBar
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var tabBar: some View {
        HStack {
            tabButton(.home, icon: "house.fill", title: "Home")
            Spacer()
            tabButton(.box, icon: "shippingbox.fill")
            
            Spacer().frame(width: 120) // space for center button
            
            tabButton(.stats, icon: "chart.bar.fill")
            Spacer()
            tabButton(.history, icon: "arrow.clockwise")
        }
        .padding(.horizontal, 30)
        .frame(height: 75)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
        )
        .overlay(centerButton, alignment: .top)
    }
    
    // Center floating button
    private var centerButton: some View {
        Button(action: {
            selectedTab = .add
        }) {
            Image(systemName: "plus")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 65, height: 65)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                   startPoint: .top, endPoint: .bottom)
                )
                .clipShape(Circle())
                .shadow(color: Color.purple.opacity(0.4), radius: 10, x: 0, y: 5)
        }
        .offset(y: -30)
    }
    
    // Tab button
    private func tabButton(_ tab: Tab, icon: String, title: String? = nil) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                if let title = title {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                }
            }
        }
    }
}

#Preview {
    CustomTabBar()
}
