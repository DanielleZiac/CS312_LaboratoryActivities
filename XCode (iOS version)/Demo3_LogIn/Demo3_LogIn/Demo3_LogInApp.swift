//
//  Demo3_LogInApp.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Abril on 9/17/24.
//

import SwiftUI
import FirebaseCore

@main
struct Demo3_LogInApp: App {
    init() {
        FirebaseApp.configure()
        print("Firebase Configured")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
