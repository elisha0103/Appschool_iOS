//
//  ContentView.swift
//  RealtimeFirebase
//
//  Created by 진태영 on 2023/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carStore: CarStore = CarStore()
    
    var body: some View {
        NavigationStack {
        VStack{
                Text("데이터베이스 변경사항: \(carStore.changeCount)")
                List {
                    ForEach(carStore.cars, id: \.self) { car in
                        NavigationLink {
                            CarDetailView(carStore: carStore, selectedCar: car)
                        } label: {
                            ListCell(car: car)
                        }
                        
                        
                    }
                }
                .navigationBarTitle(Text("EV Cars"))
                .navigationBarItems(leading:
                                        NavigationLink(destination: AddNewCarView(carStore: carStore),
                                                       label: {
                    Text("추가")
                })
                )
                
            }
        }.onAppear {
            carStore.listenToRealtimeDatabase()
        }
        .onDisappear {
            carStore.stopListening()
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Text(car.name)
        }
    }
}
