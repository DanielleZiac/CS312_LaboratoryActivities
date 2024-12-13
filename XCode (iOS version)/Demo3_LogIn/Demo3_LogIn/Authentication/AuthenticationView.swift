//
//  SignInView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Abril on 9/17/24.
//


import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
     
    var body: some View {
            ZStack {
                Image("demo3_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer(minLength: -100)
                    Text("Hello World!")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.white)
                    Spacer(minLength: 420)
                    Button(action: {
                        showSignInView = false
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("") // Remove default title
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Get Started")
                    .font(.system(size: 50, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.top, 200)
                }
            }
        }
    }

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(true))
    }
}
