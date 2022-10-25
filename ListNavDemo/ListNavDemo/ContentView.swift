//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 진태영 on 2022/10/25.
//

import SwiftUI

struct ContentView: View {
    // 저장소 클래스의 인스턴스 생성, 초기화는 JSON 파일에 있는 carData 배열로 초기화
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    var body: some View {
        // 리스트에 네비게이션 링크 작동시키기 위해서 NavagationView로 리스트 감싸줌
        NavigationView{
            // 자동차 사진과 이미지로 된 리스트 생성
            List{
                // carStore에 있는 모든 원소 리스트화 하기위한 반복문
                ForEach(carStore.cars) {car in
                    ListCell(car: car) // 1개의 셀을 구성하는 뷰의 모든 정보
                    
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
    }
    func deleteItems(at offets: IndexSet){
        carStore.cars.remove(atOffsets: offets)
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

// 리스트 셀을 더 깔끔하게 선언하기 위해서
// 1개의 셀을 구성하는 모든 정보
struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        
        // 리스트 셀을 선택하면 상세 뷰로 넘어가는 NavigationLink 선언
        // CarDetail 뷰에 car 정보 넘겨줌
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
