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
                Text("test")
                
                LottieView(name: "splash")
                                .frame(width: 200, height: 200)
                
                Button("Show Loader") {
                    LoaderManager.shared.showLoader(text: "loading")
                }
                
                Button("Show Toast"){
                    ToastManager.shared.show("Hello, this is a toast! 🎉")
                }
                
                Button("Show Ok alert") {
                    AlertManager.shared.showAlert(
                                        title: "Info",
                                        message: "This is a global info alert.",
                                        okAction: { print("Ok") }
                                    )
                }
                
                Button("Show cancel alert") {
                    AlertManager.shared.showAlert(
                        title: "Logout",
                        message: "Are you sure you want to log out?",
                        okText: "Logout",
                        cancelText: "Cancel",
                        okAction: { print("Logged out") },
                        cancelAction: { print("Canceled") }
                    )
                }
                
                Button("show red colour cancel alert"){
                    AlertManager.shared.showAlert(
                        title: "Delete",
                        message: "This action cannot be undone.",
                        okText: "Delete",
                        cancelText: "Cancel",
                        isDestructive: true,
                        okAction: { print("Deleted!") },
                        cancelAction: { print("Canceled") }
                    )
                }
//                RatingView()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        Button("Decrease",systemImage: "minus.circle"){
            withAnimation {
                rating -= 1
            }
        }
        .disabled(rating == 0)
        
        if #available(iOS 17.0, *) {
            Text("\(rating)")
                .contentTransition(.numericText(value: Double(rating)))
        } else {
            // Fallback on earlier versions
        }
        
        Button("Increase",systemImage: "plus.circle"){
            withAnimation {
                rating += 1
            }
        }
        .disabled(rating == 10)
    }
}

struct RatingContainerView:View {
    @State private var rating: Int = 5
    var body: some View {
        Gauge(value: Double(rating), in: 0...10){
            Text("Rating ")
        }
        RatingView(rating:$rating)
    }
}

struct DropdownExample: View {
    @State private var selectedOption = "Option 1"
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Selected: \(selectedOption)")
            
            Picker("Choose an option", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.menu) // 👈 This makes it a dropdown
        }
        .padding()
    }
}

struct GenderDropdownView: View {
    @State private var showDropdown = false
    @State private var selectedGender: String = ""
    
    let genders = ["Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // TextField-like button
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text(selectedGender.isEmpty ? "Select Gender" : selectedGender)
                        .foregroundColor(selectedGender.isEmpty ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text(selectedGender.isEmpty ? "Select Gender" : selectedGender)
                        .foregroundColor(selectedGender.isEmpty ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text(selectedGender.isEmpty ? "Select Gender" : selectedGender)
                        .foregroundColor(selectedGender.isEmpty ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            // Dropdown list
            if showDropdown {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedGender = gender
                                withAnimation {
                                    showDropdown = false
                                }
                            }
                        
                        Divider()
                    }
                }
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 2)
                
            }
        }
        .padding()
    }
}
