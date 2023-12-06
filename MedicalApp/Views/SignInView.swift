//
//  ContentView.swift
//  MedicalApp
//
//  Created by Mobin on 11/13/23.
//

import SwiftUI
import CoreData

//
//  ContentView.swift
//  LoginTest
//
//  Created by mobin on 10/17/23.
//

import SwiftUI

struct SignInView: View {
    
    var body: some View {
   
        NavigationStack {
            ScrollView{
                
                           VStack(spacing:20){
                               HStack(){
                                   
                                   Image("Earth")
                                       .resizable()
                                       .frame(width: 80, height: 80)
                                   VStack(alignment: .leading) {
                                       Text("Texas Health")
                                           .font(.largeTitle)
                                           .foregroundColor(Color(red: 0,
                                                                  green:0 ,
                                                                  blue: 0.5))
                                           .bold()
                                       Text("Resource")
                                           .font(.title)
                                           .foregroundColor(Color(red: 0,
                                                                  green:0 ,
                                                                  blue: 0.5))
                                       
                                   }
                               }.padding(.top)
                               HStack{
                                   Spacer()
                                   Text("My")
                                       .font(.largeTitle)
                                       .foregroundColor(Color(red: 0, green: 0, blue: 0.5)
                   )
                                       .bold()
                                   Text("Chart")
                                       .font(.title)
                                       .foregroundColor(.green)
                               }.padding(.bottom)
                               UserNameAndPasswordView()
                             

                           }.frame(width:UIScreen.main.bounds.size.height ,
                                  height: UIScreen.main.bounds.size.height)
                
                Spacer()
            }.frame(width:UIScreen.main.bounds.size.height
                    ,height: UIScreen.main.bounds.size.height + 20).padding(.top)

            
        }
    

    }
    
    

}
// it should be outside of the main scope

struct HybridTextField:  View {
    @Binding var text: String
        @State var isSecure: Bool = true
        var titleKey: String
        var body: some View {
            ZStack(alignment: .trailing){
                Group{
                    if isSecure{
                        SecureField(titleKey, text: $text).padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        
                    }else{
                        TextField(titleKey, text: $text).padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0)
                                .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    }
                }
                    .animation(.easeInOut(duration: 0.2), value: isSecure)

                //Add any common modifiers here so they dont have to be repeated for each Field
                Button(action: {
                    isSecure.toggle()
                }, label: {
                    Image(systemName: !isSecure ? "eye.slash" : "eye" )
                }).padding()
            }
        }
}

struct UserNameAndPasswordView: View {
    @State private var stringOfTextField: String = String()
    @State private var isOn = false
    @State private var isDetailActive = false
    @State private var password = ""
    @State private var isSecureText = false
    
    var body: some View {
        VStack(){
            VStack (){
                HStack(spacing: 130){
                    Text("Username")
                    Text("ForgetUserName?")
                }.padding(.top)
                TextField("Enter UserName . . .", text: $stringOfTextField)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                                
            }.padding(.horizontal)
            
            VStack (){
                HStack(spacing: 130){
                    Text("Password")
                    Text("ForgetPassword?")
                }.padding(.top)
                
           HybridTextField(text: $password, titleKey: "Enter your password ")
                
            }.padding(.horizontal)
            
            HStack{
                Toggle(isOn: $isOn) {
                    Text("Remember Password")
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                .padding()
                Spacer()
            }
            VStack{
                
                NavigationLink(destination: MainView()) {
                    Button(action: {
                        print("Login tapped")
                        
                    }) {
                        NavigationLink(destination: MainView()) {
                            
                            Text("Log in ")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.white)
                            
                        }
                        
                        
                    }
                    .background(Color.gray) // If you have this
                    .cornerRadius(10)
                    .padding()
                    
                }
                
    
  
                
                HStack(spacing: 120) {
                    VStack {
                        Image(systemName: "questionmark.circle")
                        Text("Need Help")
                    }
                    
                    VStack {
                        
                        Image(systemName: "person.badge.plus")
                        Text("Sign Up")
                    }
                    .onTapGesture {
                        NavigationLink(destination: SignUpView()) {
                            Image(systemName: "person.badge.plus")
                            Text("Sign Up")
                        }
                    }
                }
            }
        }.frame(width: screenWidth - 10, height: screenHeight/3 + 50)
        VStack(alignment:.trailing){
            InfoCell()
        }.frame(width: 380)
            .padding()
        
    }
    
    struct InfoCell: View {
        
        
        var body: some View {
            VStack(alignment:.center ){
                
                HStack{
                    Image(systemName: "cross.circle").resizable().frame(width: 40, height: 40)
                    Text("Find Physician")
                    Spacer()
                }.padding().cornerRadius(20) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(.gray, lineWidth: 2)
                    ).padding(.horizontal)
                HStack{
                    Image(systemName: "pin").resizable().frame(width: 40, height: 40)
                    Text("Find Location")
                    Spacer()
                    
                }.padding().cornerRadius(20) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(.gray, lineWidth: 2)
                    ).padding(.horizontal)
                HStack{
                    Image(systemName: "phone.and.waveform.fill").resizable().frame(width: 40, height: 40)
                    Text("Contact Us")
                    Spacer()
                    
                }.padding().cornerRadius(20) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(.gray, lineWidth: 2)
                    ).padding(.horizontal)
            }.padding(.top)
            
            
        }
    }
}


#Preview {
    SignInView()
}
