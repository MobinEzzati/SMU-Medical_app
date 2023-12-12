//
//  SignUpViewModel.swift
//  MedicalApp
//
//  Created by Mobin on 12/11/23.
//

import Foundation
import CoreData


class SignUpViewModel: ObservableObject {
    @Published var items: [UserEntity] = []

    private let coreDataManager = CoreDataStack.shared
    
    init(){
        
        fetchData() 
        
    }
    
    func fetchData() {
        
        let fetchRequest: NSFetchRequest<UserEntity>  = UserEntity.fetchRequest()
        
        do {
            
            items = try coreDataManager.viewContext.fetch(fetchRequest)
            print(items.first)
            
        }catch {
            
            print("Error fetching data: \(error)")

        }
        
    }
    
    func deleteAllRecords() {
        
    }
    
    func checkUserInfo (userName:String) -> Bool{
        
        let fetchRequest : NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userName == %@", userName)
        
        do {
            
            let count = try coreDataManager.viewContext.count(for: fetchRequest)
            return count > 0
            
        }catch {
            print("Error checking for record existence: \(error)")
            return false
        }
        
       
    }
    
    func saveUserdata( userName:String ,firstName:String ,lastName:String, password:String) {
        
        let newUser = UserEntity(context: coreDataManager.viewContext)
        newUser.userName = userName
        newUser.firstName = firstName
        newUser.lastName  = lastName
        newUser.password = password
        coreDataManager.saveContext()
    }
    
}
