//
//  EventInfo.swift
//  MedicalApp
//
//  Created by Mobin on 1/8/24.
//

import SwiftUI

struct EventInfo: View {
    
    @Binding var event : EventEntity

    var body: some View {
    
        
        VStack {
            
            Text("\(event.eventName ?? "")")
            Text("\(event.eventDate?.formatted(date: .long, time: .omitted) ?? "NO DATE")")
        }
    }
}


#Preview {
    
    struct Preview:View {
 
        @State var eventEntity  = EventEntity()


        var body: some View {
            
            EventInfo(event: $eventEntity)

        }
        
    }
    
    return Preview()
}
