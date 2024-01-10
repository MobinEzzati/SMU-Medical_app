//
//  FamilyViewModel.swift
//  MedicalApp
//
//  Created by mobin on 12/20/23.
//

import Foundation


class FamilyViewModel : ObservableObject {
    
    @Published var isAdded = false
    
    func addFamilyMember(familyModel:FamilyModel) {
        let familyMember = FamilyEntity(context:
                                            CoreDataStack.shared.persistentContainer.viewContext
        )
        
        guard  !familyModel.firstName.isEmpty,
        !familyModel.lastName.isEmpty,
        !familyModel.relationship.isEmpty ,
        !familyModel.email.isEmpty ,
        !familyModel.phoneNumber.isEmpty else {
            
            return 
        }
                 
        
        familyMember.firstName  = familyModel.firstName
        familyMember.lastName = familyModel.lastName
        familyMember.relationShip = familyModel.relationship
        familyMember.email = familyModel.email
        familyMember.phoneNumber = familyModel.phoneNumber
        CoreDataStack.shared.save()
        Task {
            
            
                           try await Task.sleep(nanoseconds: 1_000_000_000)
                           isAdded = true
        }
        
        print("we create new Family member in our system")
        
    }

    
    
}
