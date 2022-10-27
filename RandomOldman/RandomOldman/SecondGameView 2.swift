//
//  SecondGameView.swift
//  roundingRound-swiftui-20221021-team12
//
//  Created by 고도 on 2022/10/24.
//

import SwiftUI

struct SecondGameView: View {
    @State private var onOff = true
    @State private var number : Int = 6
    @State private var color : [Color] = [.green, .blue , .brown, .yellow, .black, .cyan,]
    
    @State private var tempSaver: [String] = ["", "", "", "", "", ""]
    @State private var randomNumber = 0
    @State private var rotation: Int = 10
    @State private var isActive: Bool = false
    @State private var randomInt: Int = 0
    @State private var randomSeed : Int = 0
    
    @EnvironmentObject var results: ResultData
    
    //var roller: Roller = Roller(number: $number, color: $color)
    
    var body: some View {
        VStack{
            
            Toggle("원판 보이기", isOn: $onOff)
                .padding()
            if onOff{
                //원판 배치
                // 버튼에 대한 바인딩
                Roller(number: $number, color: $color, isActive: $isActive, randomInt: $randomInt)
                //roller
            }
            
            
            //내용 입력
            VStack{
                ForEach(0..<number){index in
                    HStack{
                        Circle().frame(width: 20,height: 20).foregroundColor(color[index])
                        TextField("내용을 입력해주세요", text: $tempSaver[index])
                    }
                }
            }
            .padding()
            
            //Spacer()
            Button(action: {
                randomSeed = Int.random(in: 0..<36)
                randomInt += 360 * 5 + randomSeed * 10
                print(randomInt)
                pickMeUp()
                
                tempSaver.forEach{ str in
                    
                    if (str == "") {    //  비어있지 않으면 회전
                        
                        isActive = false
                        return
                    }
                    
                    isActive = true
                    //  print(str)
                }
                
                /*
                 var idx = 0
                 
                 ForEach(Array(tempSaver.enumerated()), id: \.offset) { index, element in
                 if (tempSaver[Int] != "") {
                 
                 isActive = true
                 }
                 }
                 */
            }) {
                Text("추첨")
            }
            Spacer()
        }
    }
    
    func pickMeUp() {
        switch randomInt % 360 {
        case 0...30:
            results.addResult(game: "[돌림판]", betting: tempSaver[4])
        case 31...90:
            results.addResult(game: "[돌림판]", betting: tempSaver[3])
        case 91...150:
            results.addResult(game: "[돌림판]", betting: tempSaver[2])
        case 151...210:
            results.addResult(game: "[돌림판]", betting: tempSaver[1])
        case 211...270:
            results.addResult(game: "[돌림판]", betting: tempSaver[0])
        case 271...330:
            results.addResult(game: "[돌림판]", betting: tempSaver[5])
        default:
            results.addResult(game: "[돌림판]", betting: tempSaver[4])
        }
    }
}

struct SecondGameView_Previews: PreviewProvider {
    static var previews: some View {
        SecondGameView().environmentObject(ResultData())
    }
}
