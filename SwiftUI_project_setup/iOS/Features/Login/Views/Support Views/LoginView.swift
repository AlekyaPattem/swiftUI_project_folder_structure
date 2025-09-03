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
    
    var body: some View {
        NavigationStack{
        VStack(spacing: 24) {
            
            // MARK: - Logo
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 60)
            
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
                let input = LoginRequest(emailMobile: "tiya@krify.com",
                                         countryCode: "+91",
                                         password: "Krify@123",
                                         deviceId: "1234",
                                         platform: 1,
                                         pushMode: 1,
                                         uniqueId: "1234")
                loginVM.login(input: input)
            }) {
                //                Text("Login")
                //                    .foregroundColor(.white)
                //                    .frame(maxWidth: .infinity)
                //                    .padding()
                //                    .background(Color.blue)
                //                    .cornerRadius(10)
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
            
            // MARK: - Forgot Password
            //            Button(action: {
            //                print("Forgot password tapped")
            //            }) {
            //                Text("Forgot Password?")
            //                    .font(.footnote)
            //                    .foregroundColor(.blue)
            //            }
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
    }
    }
}

#Preview {
    LoginView()
}

