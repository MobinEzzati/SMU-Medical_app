//
//  FamilyView.swift
//  MedicalApp
//
//  Created by Mobin on 11/27/23.
//

import SwiftUI

struct FamilyList: View {
    @State var familyMembers :[FamilyEntity] = []
    @State var selectName = ""
    @State var isClik = false
    @State  var currentIndex = 0
    @State var currentMember  = FamilyEntity()
    var body: some View {

            VStack {
                
                List {
                    ForEach(familyMembers.indices , id: \.self) { i in
                        
                        HStack {
                            Text(familyMembers[i].firstName ?? "null")
                                               Spacer()
                        }.onTapGesture {
                            isClik = true
                            currentMember = familyMembers[i]
                        }
                                  
                                   
                    
                                    }
                    .onDelete(perform: { indexSet in
                                                                let famMember = familyMembers[indexSet.first!]
                                                                CoreDataStack.shared.deleteFamilyMember(famMember: famMember)
                                        
                                                                familyMembers.remove(atOffsets: indexSet)
                                })
                   
                    
                                              
                    
                }
                
                .navigationTitle("FamilyList")
                    .navigationDestination(isPresented: $isClik, destination: {
                        FamilyMemeberInfo(famEntity: $currentMember)
                    })


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
            }.onAppear {
                familyMembers = CoreDataStack.shared.getAllFamilyMember()

            }
            
        
    }
}

#Preview {
    FamilyList()
}
