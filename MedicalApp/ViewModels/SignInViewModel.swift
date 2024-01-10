//
//  SignInViewModel.swift
//  MedicalApp
//
//  Created by Mobin on 11/27/23.
//

import Foundation


class SignInViewModel: ObservableObject {

    @Published var isExsit = false ;

    func checkUserExist (userName:String , password:String) ->  Bool{
        
        guard !userName.isEmpty, !password.isEmpty else {
           print("UserName or Password is Nill")
            
            return false
        }

//         items = CoreDataStack.shared.getAllUser()
//        items.forEach { user in
//            if user.userName == userName , user.password == password {
//                isExsit = true
//            }
//            
//        }
        return isExsit
        
    }
}
