//
//  FamilyModel.swift
//  MedicalApp
//
//  Created by mobin on 12/20/23.
//

import Foundation


struct FamilyModel: Codable {
    
    var id: UUID
    var firstName: String
    var lastName:String
    var relationship:String
    var email: String
    var phoneNumber: String
    
}
