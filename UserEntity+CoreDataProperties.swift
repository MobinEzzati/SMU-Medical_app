//
//  UserEntity+CoreDataProperties.swift
//  MedicalApp
//
//  Created by mobin on 12/17/23.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var userName: String?
    @NSManaged public var userToFamily: NSSet?
    public var familyArray : [FamilyEntity] {
        let set = userToFamily as? Set<FamilyEntity> ?? []
        return set.sorted {
            $0.wrapfirsName < $1.wrapfirsName
        }
    }

}

// MARK: Generated accessors for userToFamily
extension UserEntity {

    @objc(addUserToFamilyObject:)
    @NSManaged public func addToUserToFamily(_ value: FamilyEntity)

    @objc(removeUserToFamilyObject:)
    @NSManaged public func removeFromUserToFamily(_ value: FamilyEntity)

    @objc(addUserToFamily:)
    @NSManaged public func addToUserToFamily(_ values: NSSet)

    @objc(removeUserToFamily:)
    @NSManaged public func removeFromUserToFamily(_ values: NSSet)

}

extension UserEntity : Identifiable {

}
