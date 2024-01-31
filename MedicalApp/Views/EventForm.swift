//
//  EventForm.swift
//  MedicalApp
//
//  Created by Mobin on 1/8/24.
//

import SwiftUI

struct EventForm: View {
    @State var eventName = ""
    @State private var eventDate = Date.now
    @State var path = NavigationPath()
    @ObservedObject var eventVM = EventViewModel()

    var body: some View {
        NavigationStack {
            // 2
            Form {
                // 3
                TextField("Event Name", text: $eventName)
                DatePicker("Event Date", selection: $eventDate)
                Button("register Event") {
                    var eventModel = EventModel()
                    eventModel.id = UUID()
                    eventModel.eventDate = eventDate
                    eventModel.eventName = eventName
                    eventVM.addEvent(eventModel: eventModel)
                  
                    
                }.buttonStyle(GrowingButton())

            }.navigationDestination(isPresented: $eventVM.isAdded) {
                
                EventList()
                
            }
            .navigationBarTitle("Event Name")
        }
    }
    }


#Preview {
    EventForm()
}
