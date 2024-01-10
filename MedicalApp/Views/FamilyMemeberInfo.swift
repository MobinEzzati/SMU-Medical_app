//
//  FamilyMemeberInfo.swift
//  MedicalApp
//
//  Created by mobin on 12/24/23.
//

import SwiftUI

struct FamilyMemeberInfo: View {
    let spacing: CGFloat = 5
    var numberOfCounts = 2
    @Binding var famEntity : FamilyEntity
   
    var items = ["FirstName","LastName", "Email","Phone Number"]
    var body: some View {
        
        NavigationStack {
            
            HStack (spacing: 100) {
                VStack(alignment:.leading) {
                    Text("FirstName :\(famEntity.firstName ?? "Company Inc")")
                    Text("LastName : \(famEntity.lastName ?? "Company Inc")")
                    Text("Relationship :")
                }
                VStack(alignment: .trailing) {
                    Text("Phone : \(famEntity.phoneNumber ?? "Company Inc")")
                    Text("Email :\(famEntity.email ?? "Company Inc")")

                }
            }
            .frame(width: screenWidth)
            
                .background()
                .padding()
                .navigationTitle("Member Info")
            
            Spacer()
            
        }

    }
}

#Preview {
    
    struct Preview:View {
 
        @State var familyentity  = FamilyEntity()


        var body: some View {
            
            FamilyMemeberInfo(famEntity: $familyentity)

        }
        
    }
    
    return Preview()
}
