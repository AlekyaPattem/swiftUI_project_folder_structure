//
//  ForgotPasswordView.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 03/09/25.
//

import SwiftUI

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    @Environment(\.dismiss) private var dismiss   // To go back
    
    var body: some View {
        NavigationStack {
        VStack(spacing: 24) {
            
            // Logo
            Image(systemName: "lock.rotation")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding(.top, 40)
            
            Text("Forgot Password?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Enter your registered email to receive a reset link.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            // Email field
            VStack(alignment: .leading, spacing: 4) {
                Text("Email")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                if !isEmailValid {
                    Text("Please enter a valid email")
                        .foregroundColor(.red)
                        .font(.caption2)
                }
            }
            .padding(.horizontal)
            
            // Reset Password Button
            Button(action: {
                if isValidEmail(email) {
                    isEmailValid = true
                    // call API to send reset link
                    print("Send reset link to \(email)")
                } else {
                    isEmailValid = false
                }
            }) {
                Text("Reset Password")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Back to Login
            Button(action: {
                dismiss()  // Go back
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Back to Login")
                }
                .foregroundColor(.blue)
            }
            .padding(.bottom, 20)
        }
    }
        .navigationBarBackButtonHidden(true) // hide default back button
    }
    
    
    // Simple email validation
    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}

#Preview {
    ForgotPasswordView()
}
