//
//  FamilyEntity+CoreDataProperties.swift
//  MedicalApp
//
//  Created by mobin on 12/17/23.
//
//

import Foundation
import CoreData


extension FamilyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FamilyEntity> {
        return NSFetchRequest<FamilyEntity>(entityName: "FamilyEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var phone: Int64
    @NSManaged public var relationship: Double
    @NSManaged public var familyToUser: UserEntity?
    public var wrapfirsName :String {
        firstName ?? "Unknown name"
    }

    public var wraplastName :String {
        firstName ?? "Unknown name"
    }
}

extension FamilyEntity : Identifiable {

}
