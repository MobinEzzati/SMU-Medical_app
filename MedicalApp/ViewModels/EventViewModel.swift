//
//  EventViewModel.swift
//  MedicalApp
//
//  Created by Mobin on 1/8/24.
//

import Foundation


class EventViewModel: ObservableObject {
    
    @Published var isAdded = false
    func addEvent(eventModel:EventModel) {

        let event = EventEntity(context: CoreDataStack.shared.persistentContainer.viewContext)
        
        guard !eventModel.eventName!.isEmpty else {
            
            return
        }
        guard let eventDate = eventModel.eventDate else {
            // Handle the case when eventDate is nil
            // For example, print an error message or throw an error
            print("Error: eventDate is nil")
            // or
            // throw YourErrorType.yourError
            return
        }
        event.id = UUID()
        event.eventDate = eventDate
        event.eventName = eventModel.eventName
        CoreDataStack.shared.save()
        Task {
            
            
                           try await Task.sleep(nanoseconds: 1_000_000_000)
                           isAdded = true
        }
        
        print("we create new Event member in our system")
    }
}

