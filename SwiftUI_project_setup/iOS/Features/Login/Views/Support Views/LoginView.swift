//
//  LoginView.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 03/09/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 24) {
                    
                    Button("Show Bottom Sheet") {
                                    showSheet.toggle()
                                }
                                .buttonStyle(.borderedProminent)
                    
                    // MARK: - Logo
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .clipShape(.circle)
                        .shadow(radius: 3)
                        .overlay {
                            Circle().stroke(.green, lineWidth: 2)
                        }
                        .padding(.top,20)
                    
                    // MARK: - Username
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    // MARK: - Password
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    // MARK: - Login Button
                    Button(action: {
                        print("Login tapped")
                        let input = LoginRequest(emailMobile: username,
                                                 countryCode: "+91",
                                                 password: password,
                                                 deviceId: "1234",
                                                 platform: 1,
                                                 pushMode: 1,
                                                 uniqueId: "1234")
                        loginVM.login(input: input)
                    }) {
                        if loginVM.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                        } else {
                            Text("Login")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(username.isEmpty || password.isEmpty ? Color.gray : Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    .disabled(username.isEmpty || password.isEmpty || loginVM.isLoading)
                    
                    NavigationLink("Forgot Password?") {
                        ForgotPasswordView()
                    }
                    
                    Spacer()
                    
                    // MARK: - Signup
                    HStack {
                        Text("Don't have an account?")
                        Button(action: {
                            print("Sign Up tapped")
                        }) {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 32)
                .sheet(isPresented: $showSheet) {
                    // Content of bottom sheet
                    VStack(spacing: 20) {
                        Text("This is a default Bottom Sheet")
                            .font(.headline)
                        Button("Close") {
                            showSheet = false
                        }
                    }
                    .presentationDetents([.medium, .large]) // 👈 sheet sizes
                    .presentationDragIndicator(.visible)   // 👈 drag bar at top
                    .padding()
                }
//                .sheet(isPresented: $showSheet) {
//                    Form {
//                        Section(header: Text("Options")) {
//                            Toggle("Enable Notifications", isOn: .constant(true))
//                            Toggle("Dark Mode", isOn: .constant(false))
//                        }
//                    }
//                    .presentationDetents([.fraction(0.3), .medium, .large])
//                }
            }
        }
    }
}

#Preview {
    LoginView()
}


struct GridExample: View {
    let items = Array(1...20)
    
    // Define grid layout (2 columns)
    let columns = [
        GridItem(.flexible()),  // first column
        GridItem(.flexible())   // second column
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue.opacity(0.7))
                        .frame(height: 100)
                        .overlay(Text("Item \(item)").foregroundColor(.white))
                }
            }
            .padding()
        }
    }
}

struct HorizontalGridExample: View {
    let items = Array(1...10)
    
    // Define grid layout (2 rows)
    let rows = [
        GridItem(.fixed(120)),
//        GridItem(.fixed(120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.7))
                        .frame(width: 120)
                        .overlay(Text("Item \(item)").foregroundColor(.white))
                }
            }
            .padding()
        }
    }
}
