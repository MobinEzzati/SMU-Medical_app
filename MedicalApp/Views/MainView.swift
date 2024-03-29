//
//  MainView.swift
//  MedicalApp
//
//  Created by Mobin on 11/13/23.
//

import SwiftUI

struct MainView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible( maximum: 160)), count: 2)
    
    let relativePeople = ["Family", "Doctor","Nurse", "Events"]
    @Binding var path: NavigationPath

    var body: some View {
        NavigationStack{
            
            VStack {
                  Spacer()
                  LazyVGrid(columns: columns, spacing: 8) {
                      
                      NavigationLink(destination: FamilyList()){
                          Rectangle()
                              .frame(width: 150, height: 150) // Adjust size as needed
                              .foregroundColor(.mint)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                              .overlay(
                                  Text("Family")
                                      .foregroundStyle(.black)
                              )
                      }
                      
                      NavigationLink(destination: DoctorView()) {
                          Rectangle()
                              .frame(width: 150, height: 150) // Adjust size as needed
                              .foregroundColor(.mint)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                              .overlay(
                                  Text("Doctor")
                                      .foregroundStyle(.black)
                              )
                      }
                      NavigationLink(destination: NursesView()) {
                          Rectangle()
                              .frame(width: 150, height: 150) // Adjust size as needed
                              .foregroundColor(.mint)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                              .overlay(
                                  Text("Nurse")
                                      .foregroundStyle(.black)
                              )
                      }
                      NavigationLink(destination: EventList()) {
                          Rectangle()
                              .frame(width: 150, height: 150) // Adjust size as needed
                              .foregroundColor(.mint)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                              .overlay(
                                  Text("Events")
                                      .foregroundStyle(.black)
                              )
                      }
                  }
        
                  Spacer()
            }.navigationTitle("Main Page")
          }
            
        }
    }


struct SquareCell: View {
    @State var relatedMembersName = " "
    @State private var showWelcomeView = false
    let views = ["Family":"FamilyVeiw()"]
    var body: some View {
        NavigationStack{
            
            switch relatedMembersName {
                
            case "Family" : 
                NavigationLink(destination: FamilyList()) {
                    Rectangle()
                        .frame(width: 150, height: 150) // Adjust size as needed
                        .foregroundColor(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            Text("\(relatedMembersName)")
                                .foregroundStyle(.black)
                        )
                }
                
                
                
            default:
                NavigationLink(destination: FamilyList()) {
                    Rectangle()
                        .frame(width: 150, height: 150) // Adjust size as needed
                        .foregroundColor(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            Text("\(relatedMembersName)")
                                .foregroundStyle(.black)
                        )
                }
            }
            

        }
            // Customize color as needed
    }
}


#Preview {
    
    struct Preview:View {
        @State var path = NavigationPath()

        var body: some View {
            
            MainView(path: $path )

        }
        
    }
    
    return Preview()
}
