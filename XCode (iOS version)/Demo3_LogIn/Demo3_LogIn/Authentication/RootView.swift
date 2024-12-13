//
//  RootView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 9/19/24.
//
import SwiftUI

struct RootView: View {
    
    @State private var showAuthenticationView: Bool = true
    
    var body: some View {
        NavigationStack {
            if showAuthenticationView {
                AuthenticationView(showSignInView: $showAuthenticationView)
            } else {
                SigninEmailView(showSignInView: $showAuthenticationView)
            }
        }
    }
}

#Preview {
    RootView()
}
