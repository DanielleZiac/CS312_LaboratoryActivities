//
//  SignUpView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 9/24/24.
//

import SwiftUI
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()

        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}
struct SignUpView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phonenumber = ""
    @State private var country = ""
    @State private var birthDate = Date()
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            Image("demo3_bg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer(minLength: 20)
                Section(header: Text("Account Information") .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))) {
                    TextField("Username", text: $username)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    TextField("Email", text: $email)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                }
                
                Section(header: Text("Personal Information")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))) {
                    TextField("Phone Number", text: $phonenumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    TextField("Country", text: $country)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                }
                Toggle(isOn: $isOn) {
                    Text("I have read the Terms and Conditions")
                        .foregroundColor(.white)
                }
                .toggleStyle(iOSCheckboxToggleStyle())

                    Button {
                        Task {
                            
                        }
                    } label: {
                        Text("Sign Up")
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
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Sign Up")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                }
            }
            
        }
    }
}

#Preview {
    SignUpView()
}
