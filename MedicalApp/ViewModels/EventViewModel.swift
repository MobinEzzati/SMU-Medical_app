//
//  EventViewModel.swift
//  MedicalApp
//
//  Created by Mobin on 1/8/24.
//

import Foundation


class EventViewModel: ObservableObject {

    @Published var isAdded = false

    func addEvent(eventModel: EventModel) {
        Task {
            let event = EventEntity(context: CoreDataStack.shared.persistentContainer.viewContext)

            guard !eventModel.eventName!.isEmpty else {
                return
            }

            guard let eventDate = eventModel.eventDate else {
                print("Error: eventDate is nil")
                return
            }

            event.id = UUID()
            event.eventDate = eventDate
            event.eventName = eventModel.eventName

            CoreDataStack.shared.save()

            try await Task.sleep(nanoseconds: 1_000_000_000)

            // Update isAdded on the main thread
            await DispatchQueue.main.async {
                self.isAdded = true
            }

            print("we created a new Event member in our system")
        }
    }
}
