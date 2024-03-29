//
//  SignUpViewModel.swift
//  MedicalApp
//
//  Created by Mobin on 12/11/23.
//

import Foundation
import CoreData

@MainActor
class SignUpViewModel: ObservableObject {
    @Published var items: [UserEntity] = []
    @Published var isSignUped: Bool = false
    @Published var isTest: Bool = false

    
    
    func istest() {
        
        isTest = true 
    }
    func addUser(userName: String, firstName: String, lastName: String, email: String, password: String) {
        
        guard !userName.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !password.isEmpty else {
            // Handle the case where any of the parameters are nil or empty
            print("One or more parameters are nil or empty")
            return
        }
        

        if !checkDublication(userName: userName) {
            let user = UserEntity(context: CoreDataStack.shared.persistentContainer.viewContext)
            user.userName = userName
            user.firstName = firstName
            user.lastName = lastName
            user.email = email
            user.password = password

            CoreDataStack.shared.save()
     
            print("We Created new user in our database ")
            isSignUped = true

        } else {
            print("We already have this item in our database")
        }
        
        
    }

    func checkDublication(userName:String) -> Bool{
        var isDouble = false ;


         items = CoreDataStack.shared.getAllUser()
        items.forEach { user in
            if user.userName == userName {
                isDouble = true
            }
            
        }
        print(isDouble)
        return isDouble
    }
}
