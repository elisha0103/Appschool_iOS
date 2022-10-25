//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by 진태영 on 2022/10/25.
//

import SwiftUI

struct AddNewCar: View {
    
    // ObservedObject로 선언된 carStore 변수 이용하기
    @ObservedObject var carStore: CarStore
    
    // TextField에 사용 될 State 변수 선언
    @State var isHybrid = false
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Car Details")){
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                // 새로운 자동차에 대한 상세 정보를 DataInput 하위 뷰에 전달
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                // 토글로 isHybrid 변수 값 저장
                Toggle(isOn: $isHybrid){
                    Text("Hybrid").font(.headline)
                }
                .padding()
            }
            Button(action: addNewCar){
                Text("Add Car")
            }
        }
        
        
    }
    
    // 버튼 눌렀을 때 실행되는 추가 함수
    func addNewCar(){
        // newCar에 대한 새로운 인스턴스 생성
        let newCar = Car(id: UUID().uuidString,
                         name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        // 이미지는 고정
        // 자동차 배열에 추가
        carStore.cars.append(newCar)
    }
    
}

// 새로운 자동차 상세 정보 처리할 하위 뷰
struct DataInput: View{
    
    var title: String
    // 사용자 입력 값을 전달하기 위해 바인딩된 변수
    @Binding var userInput: String
    
    var body: some View{
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
    
    
}

struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStore(cars: carData))
    }
}


