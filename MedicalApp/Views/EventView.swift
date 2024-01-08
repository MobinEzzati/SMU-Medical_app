//
//  EventView.swift
//  MedicalApp
//
//  Created by mobin on 1/7/24.
//

import SwiftUI

struct EventView: View {
    
    @State var familyView = ["A","B","C"]
    @State var selectName = ""
    @State var isClik = false

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                List {
                    ForEach(familyView , id: \.self){ item in
                        Text(item)
                    }
                }.navigationTitle("Event")
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
 
                    Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: FamilyForm()) {
                            
                            Image(systemName: "plus.app")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                        }


                            
                    })
                   }
            }
            
        }
        

    }
}

#Preview {
    EventView()
}
