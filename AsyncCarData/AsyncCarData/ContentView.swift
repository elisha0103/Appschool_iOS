//
//  ContentView.swift
//  AsyncCarData
//
//  Created by 진태영 on 2022/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carStore: CarStore = CarStore(cars: [])
    var webService: WebService = WebService()
    
    let url: String = "https://mocki.io/v1/d8dd99ac-b85a-4665-9fb5-324afedd5928"
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(carStore.cars){car in
                        ListCell(car: car)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .navigationTitle(Text("EV Cars"))
                .navigationBarItems(leading: NavigationLink(destination: AddNewCar(carStore: self.carStore)){
                    Text("Add")
                        .foregroundColor(.blue)
                }, trailing: EditButton())
            }
            VStack{
                Image(systemName: "car.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .font(.largeTitle)
                
                Button("Fetch Data"){
                    print("df")

                    Task{
                        carStore.cars = try await webService.fetchData(url: url)
                        print(carStore.cars)
                    }
                }
            }
        }
    }
    func deleteItems(at offsets: IndexSet){
        carStore.cars.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int){
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View{
    var car: Car
    var body: some View{
        NavigationLink(destination: CarDetail(selectedCar: car)){
            HStack{
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}
