//
//  SignUpView.swift
//  MedicalApp
//
//  Created by Mobin on 11/29/23.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        @State  var firstName = ""
        @State  var lastName = ""
        @State  var userName = ""
        @State  var password = ""
        @State  var confirmPassword = ""
        @State  var email = ""
        @State  var isExsits = false
        @ObservedObject  var signUpViewModel = SignUpViewModel()
        NavigationStack {
            VStack(spacing: 20){
                
                TextField("userName", text: $userName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("firstName", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("lastName", text: $lastName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Email", text: $email)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("password", text: $password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("confirm Password", text: $confirmPassword)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                
              
                    Button(action: {
                        
                        print("this is test")
                        print(firstName)

                        if !signUpViewModel.checkUserInfo(userName: userName) {
                            signUpViewModel.saveUserdata(userName: userName,
                                                         firstName:firstName,
                                                         lastName: lastName,
                                                         password: password
                                                        )
            
                        }else {
                            print("we already have this item")

                        }
                        
                        
                    }) {
                        
                            
                            Text("Sign up ")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.white)
                            
                        
                        
                        
                    }
                    .background(Color.gray) // If you have this
                    .cornerRadius(10)
                    .padding()
              


            }.navigationTitle("Sign Up")
            .padding()
            
        }
    }
}

#Preview {
    SignUpView()
}
