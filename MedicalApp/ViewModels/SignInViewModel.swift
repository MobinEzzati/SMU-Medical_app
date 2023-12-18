//
//  SignInViewModel.swift
//  MedicalApp
//
//  Created by Mobin on 11/27/23.
//

import Foundation

class SignInViewModel: ObservableObject {
    var items: [UserEntity] = []
   @Published var isExsit = false ;

    func checkUserExist (userName:String , password:String) ->  Bool{
        


         items = CoreDataStack.shared.getAllUser()
        items.forEach { user in
            if user.userName == userName , user.password == password {
                isExsit = true
            }
            
        }
        return isExsit
        
    }
}
