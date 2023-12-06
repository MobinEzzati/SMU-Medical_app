//
//  FamilyView.swift
//  MedicalApp
//
//  Created by Mobin on 11/27/23.
//

import SwiftUI

struct FamilyView: View {
    var body: some View {
        NavigationStack{
           
            VStack {
                List {
                    Text("ddf")
                    Text("ddf")
                    Text("ddf")
                    Text("ddf")

                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
 
                    Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: FamilyInfoView()) {
                            
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
    FamilyView()
}
