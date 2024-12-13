//
//  SettingsView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 9/19/24.
//

import SwiftUI
@MainActor
final class SettingsViewModel: ObservableObject {
    
    func signOut() throws{
         try AuthenticationManager.shared.signOut()
        print("Signed out...")
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws{
        let email = "hello123@gmail.com"
        try await AuthenticationManager.shared.sendEmailVerification(email: email)
    }
    
    func updatePassword() async throws{
        let password = "Hello123"
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            Image("demo3_bg4")
            
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                    Button(action: {
                        Task {
                            do {
                                try viewModel.signOut()
                                showSignInView = true
                            } catch {
                            print(error)
                            }
                        }
                    }) {
                        
                    Text("Log out")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    }
                    emailSection
                    Spacer()
                }
                .navigationTitle("Settings")
                .padding(.top, 100)
                .navigationBarTitleDisplayMode(.inline)
                            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Settings")
                        .foregroundColor(.white) 
                        .font(.system(size: 24, weight: .bold))
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(true))
    }
}
extension SettingsView {
    private var emailSection: some View {
        VStack(spacing: 5) { // Added spacing between email buttons
            Text("Email Functions")
                .font(.headline)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Password Reset")
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }) {
                Text("Reset Password")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.blue.opacity(0.2)) // Background with opacity
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Password Updated")
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }) {
                Text("Update Password")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.blue.opacity(0.2)) // Background with opacity
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Email Updated")
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }) {
                Text("Update Email")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.blue.opacity(0.2)) // Background with opacity
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.top) // Add padding to the top of the email section
        .background(Color.clear) // Ensure clear background for the email section
    }
}
