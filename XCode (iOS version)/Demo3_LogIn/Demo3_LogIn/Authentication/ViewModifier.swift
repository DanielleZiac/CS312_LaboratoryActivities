//
//  ViewModifier.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 11/18/24.
//

import SwiftUI

struct NavigationStyle: ViewModifier {
    var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            //.navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(showSignInView: .constant(false))) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }
                }
            }
    }
}
