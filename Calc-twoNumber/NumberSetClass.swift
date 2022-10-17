//
//  NumberSetClass.swift
//  Calc-twoNumber
//
//  Created by 진태영 on 2022/10/14.
//
import Foundation

struct NumberSet{
    let number1: Float  // 첫번째 피연산자
    let number2: Float  // 두번째 피연산자
    let op: String      // 연산자
    var result: String = ""  // 초기화 후 계산된
    
    init (_ number1: Float, _ number2: Float, _ op: String){
        self.number1 = number1  // 첫 번째 피연산자 저장
        self.number2 = number2  // 두 번째 피연산자 저장
        self.op = op            // 연산자 저장
        switch self.op{  // 연산자에 따른 switch
        case "➕":
            self.result = "\(self.number1 + self.number2)"
            
        case "➖":
            self.result = "\(self.number1 - self.number2)"
            
        case "✖️":
            self.result = "\(self.number1 * self.number2)"
            
        case "➗":
            if self.number2 == 0{  // 0으로 나누면 result에 아래 문구 저장
                self.result = "Can't divide"
                break
            }
            self.result = "\(self.number1 / self.number2)"
        case "%":
            self.result = "\(self.number2 * 0.01)"
            
        default:  // op 선택 없이 숫자만 누르고 '=' 누를경우 출력할 문구
            self.result = "Select OP"
            break
        }
    }
}
