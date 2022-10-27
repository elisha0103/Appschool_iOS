//
//  CalculatorView.swift
//  RandomOldman
//
//  Created by 최한호 on 2022/10/26.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject var resultData: ResultData
    
    @State private var totalNumber: String = "0"
    @State private var number1: Float = 0
    @State private var number2: Float = 0
    @State private var op: String = ""
    @State private var flag: Bool = false
    
    var body: some View {
        
        VStack {
            
            // Spacer()
            Text("\(totalNumber)")
                .padding()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: 120, alignment: .trailing)
                .font(.system(size: 88, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
                .contextMenu {
                    Button(action: {
                        
                        if totalNumber.count == 1 {
                            totalNumber = "0"
                        } else {
                            totalNumber.popLast()
                        }
                        
                    }) {
                        Text("한 자리 지우기")
                        Image(systemName: "delete.left.fill")
                    }
                    
                    Button(action: {
                        
                        totalNumber = "0"
                        
                    }) {
                        Text("전부 지우기")
                        Image(systemName: "trash.fill")
                    }
                }
            
            VStack {
                
                HStack {
                    
                    
                    Button{
                        extraButtonPressed("C")
                    } label: {
                        Text("C")
                    }
                    .modifier(NumberButton())
                    .background(Color("ExtraButtonColor"))
                    
                    Button{
                        extraButtonPressed("±")
                    } label: {
                        Text("±")
                    }
                    .modifier(NumberButton())
                    .background(Color("ExtraButtonColor"))
                    
                    Button{
                        extraButtonPressed("%")
                        
                    } label:{
                        Text("%")
                    }
                    .modifier(NumberButton())
                    .background(Color("ExtraButtonColor"))
                    
                    Button{
                        opButtonPressed("÷")
                        
                    } label:{
                        Text("÷")
                    }
                    .modifier(NumberButton())
                    .background(Color("OperatorButtonColor"))
                }
                
                HStack {
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "7"
                        }else{
                            totalNumber += "7"
                        }
                    } label: {
                        Text("7")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "8"
                        }else{
                            totalNumber += "8"
                        }
                    } label: {
                        Text("8")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "9"
                        }else{
                            totalNumber += "9"
                        }
                    } label: {
                        Text("9")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        opButtonPressed("×")
                    } label: {
                        Text("×")
                    }
                    .modifier(NumberButton())
                    .background(Color("OperatorButtonColor"))
                }
                
                HStack {
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "4"
                        }else{
                            totalNumber += "4"
                        }
                    } label: {
                        Text("4")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "5"
                        }else{
                            totalNumber += "5"
                        }
                    } label: {
                        Text("5")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "6"
                        }else{
                            totalNumber += "6"
                        }
                    } label: {
                        Text("6")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        opButtonPressed("-")
                    } label: {
                        Text("-")
                    }
                    .modifier(NumberButton())
                    .background(Color("OperatorButtonColor"))
                    
                }
                
                HStack {
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0" {
                            totalNumber = "1"
                        }else{
                            totalNumber += "1"
                        }
                    } label: {
                        Text("1")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        if totalNumber == "0"{
                            totalNumber = "2"
                        }else{
                            totalNumber += "2"
                        }
                    } label: {
                        Text("2")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "3"
                        }else{
                            totalNumber += "3"
                        }
                    } label: {
                        Text("3")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        opButtonPressed("+")
                    } label: {
                        Text("+")
                    }
                    .modifier(NumberButton())
                    .background(Color("OperatorButtonColor"))
                }
                
                HStack {
                    Button{
                        if (flag == true) {
                            
                            totalNumber = "0"
                            flag = false
                        }
                        
                        if totalNumber == "0"{
                            totalNumber = "0"
                        }
                        else{
                            totalNumber += "0"
                            
                        }
                    } label: {
                        Text("0")
                    }
                    .frame(width: 168, height: 80)
                    .background(Color("BackgroundSpaceColor"))
                    .foregroundColor(.white)
                    .font(.system(size: 33))
                    
                    Button{
                        if !totalNumber.contains("."){
                            totalNumber += "."
                        }
                    } label: {
                        Text(".")
                    }
                    .modifier(NumberButton())
                    .background(Color("BackgroundSpaceColor"))
                    
                    Button{
                        resultButtonPressed()
                    } label: {
                        Text("=")
                    }
                    .modifier(NumberButton())
                    .background(Color("OperatorButtonColor"))
                    
                }
            }
        }
    }
    
    //  ----- Function -----
    
    func opButtonPressed(_ iop: String){
        op = iop
        number1 = Float(totalNumber) ?? 0
        totalNumber = "0"
        
    }
    
    func extraButtonPressed(_ iop: String){
        if iop == "±"{
            if totalNumber.first == "-"{
                totalNumber.removeFirst()
            } else{
                if ((totalNumber != "0") || (totalNumber != "0.0")) {
                    totalNumber = "-" + totalNumber
                }
            }
        } else if iop == "%" {
            totalNumber = String((Float(totalNumber) ?? 0) * 0.01)
        }else{
            totalNumber = "0"
            number1 = 0
            number2 = 0
            op = ""
        }
    }
    
    func resultButtonPressed(){
        var result: Float = 0
        number2 = Float(totalNumber) ?? 0
        
        switch op{
        case "+":
            result = number1 + number2
        case "-":
            result = number1 - number2
        case "×":
            result = number1 * number2
        case "÷":
            if number2 == 0 {
                totalNumber = "오류"
                break
            }
            result = number1 / number2
        default:
            break
        }
        
        if totalNumber != "오류" {
            totalNumber = String(result)
        }
        
        if (totalNumber.suffix(2) == ".0") {
            totalNumber = String(Int(result))
        }
        
        flag = true
        
        resultData.calCount += 1
        
        
        if totalNumber == "오류" {
            resultData.resultString.insert("[계산기] 오류 : 0으로 나눌 수 없습니다.", at: 0)
        } else {
            
            // number1, number2는 Float 타입이다.
            // number1과 number2 모두 .0 으로 끝나는 경우
            if String(number1).suffix(2) == ".0" && String(number2).suffix(2) == ".0" {
                
                // number1과 number2 모두 Int 형변환을 시켜 출력한다
                resultData.resultString.insert("[계산기] \(Int(number1)) \(op) \(Int(number2)) = \(totalNumber)", at: 0)
                
                // number2만 .0 으로 끝나는 경우
            } else if String(number1).suffix(2) != ".0" && String(number2).suffix(2) == ".0" {
                
                // number2만 Int 형변환을 시켜 출력한다.
                resultData.resultString.insert("[계산기] \(number1) \(op) \(Int(number2)) = \(totalNumber)", at: 0)
                
                // number1만 .0 으로 끝나는 경우
            } else if String(number1).suffix(2) == ".0" && String(number2).suffix(2) != ".0" {
                
                // number1만 Int 형변환을 시켜 출력한다.
                resultData.resultString.insert("[계산기] \(Int(number1)) \(op) \(number2) = \(totalNumber)", at: 0)
                
                // 둘 다 Float 형식일 경우 그대로 출력한다.
            } else {
                
                resultData.resultString.insert("[계산기] \(number1) \(op) \(number2) = \(totalNumber)", at: 0)
            }
        }
        
    }

    struct NumberButton: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 80, height: 80)
            //.background(.gray)
                .foregroundColor(.white)
                .font(.system(size: 33))
            // .border(Color.black, width: 0.1)
        }
    }
    
    struct CalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            CalculatorView().environmentObject(ResultData())
        }
    }
}
