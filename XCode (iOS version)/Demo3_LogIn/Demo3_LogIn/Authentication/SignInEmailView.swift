//
//  SigninEmailView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Abril on 9/18/24.
//

import SwiftUI
import FirebaseAuth

@MainActor
final class SignInEmailViewModel: ObservableObject{

    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        do {
            try await AuthenticationManager.shared.createUser(email: email, password: password)
        } catch {
            handleError(error)
        }
    }
    
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        print("Email entered: \(email)")
        print("Password entered: \(password)")
        
        do {
            try await AuthenticationManager.shared.signInUser(email: email, password: password)
        } catch {
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error) {
            if let errorCode = (error as NSError?)?.code {
                switch errorCode {
                case AuthErrorCode.invalidCredential.rawValue:
                    print("Error: Invalid credentials.")
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    print("Error: The email is already in use.")
                case AuthErrorCode.weakPassword.rawValue:
                    print("Error: The password is too weak.")
                default:
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
}

struct SigninEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            Button {
                Task {
                    /*do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }*/
                    
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In with Email")
    }
}

#Preview {
    NavigationStack{
        SigninEmailView(showSignInView: .constant(false))
    }
}
