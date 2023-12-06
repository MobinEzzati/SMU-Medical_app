//
//  FamilyInfoView.swift
//  MedicalApp
//
//  Created by Mobin on 11/29/23.
//

import SwiftUI

struct FamilyInfoView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var relationShip: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""

    @State private var username: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Enter your FirsName . . .", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Enter your LastName . . .", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("what is your relationship . . .", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Enter your phone number  . . .", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                TextField("Enter your email . . .", text: $firstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
     


            }
                .font(.footnote)
                .navigationTitle("Family Information")
                .padding()
    
            
        }
    }
}

#Preview {
    FamilyInfoView()
}
