//
//  SigninEmailView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Abril on 9/18/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject{

    @Published var email = ""
    @Published var password = ""
    
}

struct SigninEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    @State private var errorMessage: String? = nil
    @State private var isSignedIn: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("demo3_bg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer(minLength: 480)
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                Button {
                    Task {
                        await signInUser()
                    }
                } label: {
                    Text("Sign In with Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't Have an Account?")
                        .foregroundColor(.black)
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("") // Remove default title
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Sign In")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                }
            }
            
            .fullScreenCover(isPresented: $isSignedIn) {
                SignedInView(showSignInView: $showSignInView)
            }
        }
    }
    
    private func signInUser() async {
        print("Signing in...")
        do {
            let authResult = try await AuthenticationManager.shared.signInUser(email: viewModel.email, password: viewModel.password)
            print("User signed in successfully: \(authResult.uid)")

            // Clear error message and navigate to SettingsView on success
            errorMessage = nil
            isSignedIn = true
        } catch {
            // Show error message on failure
            errorMessage = "Failed to sign in: \(error.localizedDescription)"
            isSignedIn = false
        }
    }
}

#Preview {
    NavigationStack{
        SigninEmailView(showSignInView: .constant(true))
    }
}
