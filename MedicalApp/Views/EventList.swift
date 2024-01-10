//
//  EventView.swift
//  MedicalApp
//
//  Created by mobin on 1/7/24.
//

import SwiftUI

struct EventList: View {
    
    @State var familyView = ["A","B","C"]
    @State var selectName = ""
    @State var isClik = false
    @State var eventList :[EventEntity] = []
    @State var currentMember  = EventEntity()
//    @Binding var path: NavigationPath

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                VStack {
                    
                    List {
                        ForEach(eventList.indices , id: \.self) { i in
                            
                            
                            
                            HStack {
                                Text(eventList[i].eventName ?? "null")
                                Spacer()
                                Text("\(eventList[i].eventDate?.formatted(date: .long, time: .omitted) ?? "NO DATE")")


                             
                            }.onTapGesture {
                                isClik = true
                                currentMember = eventList[i]
                            }
                            
                            
                            
                        }
                        .onDelete(perform: { indexSet in
                            let deletedEvent = eventList[indexSet.first!]
                            CoreDataStack.shared.deleteEvent(event: deletedEvent)
                            
                            eventList.remove(atOffsets: indexSet)
                        })
                        
                        
                        
                        
                    }
                    
                    .navigationTitle("EventList")
                    .navigationDestination(isPresented: $isClik, destination: {
                        EventInfo(event: $currentMember)
                    })
                }
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        
                        Button(action: {
                            
                        }, label: {
                            NavigationLink(destination: EventForm()) {
                                
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                            }
                            
                            
                            
                        })
                    }
                }
                
            }.onAppear(perform: {
                eventList = CoreDataStack.shared.getEventList()
            })
            
            
        }
    }
    

}


#Preview {
    
    EventList()

  
}

