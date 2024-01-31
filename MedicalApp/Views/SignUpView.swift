//
//  SignUpView.swift
//  MedicalApp
//
//  Created by Mobin on 11/29/23.
//

import SwiftUI

struct SignUpView: View {
    @State  private var firstName: String  = ""
    @State  private var lastName = ""
    @State  private var userName = ""
    @State  private var password = ""
    @State  private var confirmPassword = ""
    @State  private var email = ""

    @State var path = NavigationPath()
    @State var gotoLoginView = false
    @ObservedObject  var signUpViewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
          self.presentationMode.wrappedValue.dismiss()
          }) {
              HStack {
   
                  Text("< back")
              }
          }
      }
      
    var body: some View {
        NavigationStack {

            ScrollView{
                VStack(spacing: 20){
                    TextField("Username", text: $userName)
                        .keyboardType(.default)
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
                        
                    signUpViewModel.addUser(userName: userName,
                                                                        firstName:firstName,
                                                                        lastName: lastName,
                                                                        email: email,
                                                                        password: password
                                                                            )
                        
                        if signUpViewModel.isSignUped {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }
                        
                    })
                    {
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
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: btnBack)
            }
        }

    
    }
}

#Preview {
    SignUpView()
}
