//
//  ListDemo.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/25.
//

import SwiftUI

struct ToDoItem: Identifiable{
    var id = UUID()
    
    var task: String
    var imageName: String
}

var listData: [ToDoItem] = [
    ToDoItem(task: "Wash the car", imageName: "car.fill"),
    ToDoItem(task: "Vacuum house", imageName: "house.fill"),
    ToDoItem(task: "Pick up kids from school bus @ 3pm", imageName: "bus.doubledecker"),
    ToDoItem(task: "Auction the kids on ebay", imageName: "cart.fill"),
    ToDoItem(task: "Order Pizza for dinner", imageName: "fork.knife")
]

struct ListDemo: View {
    @State private var toggleStatus = true
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Settings")){
                    Toggle(isOn: $toggleStatus){
                        Text("Allow Notification")
                    }
                }
                Section(header: Text("To Do Tasks")){
                    ForEach(listData) {item in
                        NavigationLink(destination: Text(item.task)){
                            HStack{
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

func deleteItem(indexSet: IndexSet){
    print("indexSet: \(indexSet) delete")
    print(listData)
}

func moveItem(from source: IndexSet, to destination: Int){
    print("source: \(source)")
    print("destination: \(destination)")
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
