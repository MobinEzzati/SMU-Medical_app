//
//  CoreDataStack.swift
//  MedicalApp
//
//  Created by Mobin on 12/11/23.
//

import Foundation
import CoreData

class CoreDataStack  {

    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataStack()
    
    var viewContext: NSManagedObjectContext {
        return  persistentContainer.viewContext
    }
    
    func getAllUser() -> [UserEntity]{
        var records : [UserEntity] = []
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do {
            
            
            records = try viewContext.fetch(request)
              
        }catch {
            print("Error fetching records: \(error.localizedDescription)")
        }
        
        return  records
    }
    
    func save() {
        do {
            try viewContext.save()
        }catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    
   private init (){
        persistentContainer = NSPersistentContainer(name: "SMU_DB")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                
                fatalError("Unresolved error \(error)")
            }
            self.persistentContainer.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump 
        }
    }

//    lazy var persistentContainer: NSPersistentContainer = {
//        
//        let container = NSPersistentContainer(name: "SMU_DB")
//        container.loadPersistentStores { _, error in
//            if let error = error {
//                fatalError("Unresolved error \(error)")
//            }else {
//                print("succesful coredata")
//            }
//        }
//        return container
//    }()

//T
}
