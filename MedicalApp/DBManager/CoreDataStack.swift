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
    
    func deleteFamilyMember(famMember:FamilyEntity) {
        persistentContainer.viewContext.delete(famMember)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func deleteEvent(event:EventEntity) {
        persistentContainer.viewContext.delete(event)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getAllUser() -> [UserEntity]{
        var records : [UserEntity] = [UserEntity]()
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do {
            
            
            records = try viewContext.fetch(request)
              
        }catch {
            print("Error fetching records: \(error.localizedDescription)")
        }
        
        return  records
    }
    
    func getFamilyRecord(firstName:String, lastName: String) -> FamilyEntity {
        let fetchRequest: NSFetchRequest<FamilyEntity>
        fetchRequest = FamilyEntity.fetchRequest()
     
        let firstName = NSPredicate(format : "firstName = %@", firstName )
        let lastName = NSPredicate (format:
         "lastName = %@", lastName
        )
        
        fetchRequest.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
        firstName,
        lastName
        ]
        )
        
        let context = persistentContainer.viewContext
        let object = try! context.fetch(fetchRequest)
        return object.first!
    }
    
    func getAllFamilyMember() -> [FamilyEntity] {
        var records : [FamilyEntity] = []
        
        let recquest: NSFetchRequest<FamilyEntity> = FamilyEntity.fetchRequest()
        do {
            records = try viewContext.fetch(recquest)
        }catch {
            print("Error fetching records: \(error.localizedDescription)")
        }
        
        return  records
    }
    
    
    func getEventList() -> [EventEntity] {
        
        var records : [EventEntity] = []
        
        let recquest: NSFetchRequest<EventEntity> = EventEntity.fetchRequest()
        do {
            records = try viewContext.fetch(recquest)
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
