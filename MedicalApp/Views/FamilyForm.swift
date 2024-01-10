//
//  FamilyInfoView.swift
//  MedicalApp
//
//  Created by Mobin on 11/29/23.
//

import SwiftUI

struct FamilyForm: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var relationShip: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State var path = NavigationPath()
    @ObservedObject var familyVM = FamilyViewModel()


    var body: some View {
        NavigationStack {
            
            VStack(spacing: 20) {
                TextField("Enter your FirsName . . .", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Enter your LastName . . .", text: $lastName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("what is your relationship . . .", text: $relationShip)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Enter your phone number  . . .", text: $phoneNumber)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Enter your email . . .",
                          text: $email)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                Button(action: {
                    
                    
                    let familyMember = FamilyModel(
                        id: UUID(),
                        firstName: firstName,
                        lastName: lastName,
                        relationship: relationShip,
                        email: email, 
                        phoneNumber: phoneNumber)

                    
                    familyVM.addFamilyMember(familyModel: familyMember)
                })
                {
                    
          
                    
                    Text("Add")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                    
     
                    
                }
                .background(Color.gray)
                .cornerRadius(10)
                .padding()
     


            }
                .font(.footnote)
                .navigationTitle("Family Information")
                .navigationDestination(isPresented:
                                        $familyVM.isAdded,
                                       destination: {
                    FamilyView()
                })
        
                .padding()
    
            
        }
    }
}

#Preview {
    FamilyForm()
}
