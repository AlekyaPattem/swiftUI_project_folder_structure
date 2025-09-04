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
    
//    enum Tab: Hashable { case home, box, stats, history, add }
//
//    // MARK: - Scaffold with pages
//    struct CurvedTabScaffold: View {
//        @State private var selected: Tab = .home
//
//        var body: some View {
//            ZStack(alignment: .bottom) {
//                // Example pages
//                Group {
//                    switch selected {
//                    case .home: Color(.systemGroupedBackground).overlay(Text("Home").font(.title))
//                    case .box:  Color(.systemGroupedBackground).overlay(Text("Box").font(.title))
//                    case .stats: Color(.systemGroupedBackground).overlay(Text("Stats").font(.title))
//                    case .history: Color(.systemGroupedBackground).overlay(Text("History").font(.title))
//                    case .add: Color(.systemGroupedBackground).overlay(Text("Add Flow").font(.title))
//                    }
//                }
//                .ignoresSafeArea()
//
//                CustomCurvedTabBar(selected: $selected)
//            }
//            .ignoresSafeArea(edges: .bottom)
//        }
//    }
//
//    // MARK: - The custom curved tab bar with FAB and notch
//    struct CustomCurvedTabBar: View {
//        @Binding var selected: Tab
//
//        // Tweak these to match your screenshot perfectly
//        private let barHeight: CGFloat = 78
//        private let cornerRadius: CGFloat = 28
//        private let fabSize: CGFloat = 64
//        private let notchDepth: CGFloat = 22     // how deep the curve goes into the bar
//        private let notchPadding: CGFloat = 6     // extra breathing room around FAB inside the notch
//
//        var body: some View {
//            ZStack(alignment: .top) {
//
//                // Background with concave notch under the + button
//                NotchedTabBackground(
//                    cornerRadius: cornerRadius,
//                    notchRadius: (fabSize / 2) + notchPadding,
//                    notchDepth: notchDepth
//                )
//                .fill(Color.white, style: FillStyle(eoFill: true)) // even-odd fill subtracts the circle
//                .shadow(color: .black.opacity(0.08), radius: 20, x: 0, y: 4)
//                .frame(height: barHeight)
//                .overlay(tabItems.padding(.horizontal, 26).padding(.bottom, 12), alignment: .bottom)
//
//                // Floating action button (+) with soft glow
//                Button {
//                    selected = .add
//                } label: {
//                    ZStack {
//                        // soft glow
//                        Circle()
//                            .fill(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))
//                            .frame(width: fabSize + 28, height: fabSize + 28)
//                            .blur(radius: 18)
//                            .opacity(0.35)
//
//                        Circle()
//                            .fill(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))
//                            .frame(width: fabSize, height: fabSize)
//                            .overlay(
//                                Image(systemName: "plus")
//                                    .font(.system(size: 28, weight: .bold))
//                                    .foregroundStyle(.white)
//                            )
//                    }
//                }
//                // lift the FAB so it sits inside the notch
//                .offset(y: -notchDepth - 6)
//            }
//            .padding(.horizontal, 18)
//            .padding(.bottom, 8)
//        }
//
//        // MARK: Tab Items
//        private var tabItems: some View {
//            HStack {
//                tab(.home, icon: "house", label: "Home") // outlined home to resemble your screenshot
//                Spacer()
//                tab(.box, icon: "shippingbox")
//                Spacer().frame(width: fabSize + 24) // gap for the center FAB
//                tab(.stats, icon: "chart.bar.fill")
//                Spacer()
//                tab(.history, icon: "arrow.clockwise")
//            }
//        }
//
//        @ViewBuilder
//        private func tab(_ tab: Tab, icon: String, label: String? = nil) -> some View {
//            Button {
//                selected = tab
//            } label: {
//                VStack(spacing: 4) {
//                    Image(systemName: icon)
//                        .font(.system(size: 22, weight: .semibold))
//                        .foregroundStyle(selected == tab ? Color.blue : Color.gray.opacity(0.6))
//                    if let label {
//                        Text(label)
//                            .font(.footnote)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(selected == tab ? Color.blue : Color.gray.opacity(0.6))
//                    }
//                }
//                .frame(maxWidth: .infinity)
//            }
//        }
//    }
//
//    // MARK: - Background shape with a circular notch cut out of the top edge
//    struct NotchedTabBackground: Shape {
//        var cornerRadius: CGFloat
//        var notchRadius: CGFloat
//        var notchDepth: CGFloat
//
//        // If you ever want to animate depth, make it animatable:
//        var animatableData: AnimatablePair<CGFloat, CGFloat> {
//            get { AnimatablePair(notchRadius, notchDepth) }
//            set {
//                notchRadius = newValue.first
//                notchDepth = newValue.second
//            }
//        }
//
//        func path(in rect: CGRect) -> Path {
//            // Base rounded rect
//            var path = Path(roundedRect: rect, cornerRadius: cornerRadius)
//
//            // Circle to carve out from the top edge (even-odd fill does the subtraction)
//            // Place the circle center slightly ABOVE the top edge so only a "notchDepth"
//            // portion dips into the bar.
//            let r = notchRadius
//            let center = CGPoint(x: rect.midX, y: -(r - notchDepth))
//            let circleRect = CGRect(x: center.x - r, y: center.y - r, width: r * 2, height: r * 2)
//
//            path.addEllipse(in: circleRect)
//            return path
//        }
//    }



#Preview {
    CustomTabBar()
}

//struct ContentView: View {
//    var body: some View {
//        CustomTabBar()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
