//
//  EventModel.swift
//  MedicalApp
//
//  Created by Mobin on 1/8/24.
//

import Foundation


struct EventModel: Codable {
    
    var id : UUID?
    var eventName:String?
    var eventDate:Date?
}
