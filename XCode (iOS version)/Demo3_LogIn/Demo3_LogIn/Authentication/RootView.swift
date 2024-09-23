//
//  RootView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 9/19/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView(showSignInView: .constant(false))
            }
        }
    }
}

/*struct RootView: View {
    
    @State private var showSignInView: Bool = false
    @State private var isLoading: Bool = true  // Keep track of loading status
    
    var body: some View {
        ZStack {
            if isLoading {
                // Show loading indicator until authentication check is complete
                ProgressView("Loading...")
            } else if showSignInView {
                // Show sign-in view if user is not authenticated
                AuthenticationView(showSignInView: $showSignInView)
            } else {
                // Main content for authenticated users
                NavigationStack {
                    SettingsView(showSignInView: $showSignInView)
                }
            }
        }
        .onAppear {
            Task {
                await checkAuthenticationStatus()  // Call async authentication check
            }
        }
    }
    
    // Asynchronous function to check authentication status
    func checkAuthenticationStatus() async {
        do {
            let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
            // User is authenticated, no need to show the sign-in view
            showSignInView = false
        } catch {
            // No authenticated user found, show the sign-in view
            showSignInView = true
        }
        // Stop the loading state after authentication status is checked
        isLoading = false
    }
}*/


#Preview {
    RootView()
}
