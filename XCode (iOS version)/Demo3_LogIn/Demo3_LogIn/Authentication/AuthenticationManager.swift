//
//  AuthenticationManager.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Abril on 9/18/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init() {
        
    }
}
final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func createUser(email: String, password: String) async throws{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthDataResultModel(
            uid: authDataResult.user.uid,
            email: authDataResult.user.email,
            photoUrl: authDataResult.user.photoUrl)
    }
}
