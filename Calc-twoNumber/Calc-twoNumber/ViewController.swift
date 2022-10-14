//
//  ViewController.swift
//  Calc-twoNumber
//
//  Created by 진태영 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer() // 말하기 변수
    var op: String?    // 연산자 받을 변수
    var resultString: String = ""  // 연산 결과 변수
    var tmpNumber: String = ""  // 입력받은 숫자를 임시로 저장할 변수
    var number1: String = ""  // 라벨로부터 첫번째로 입력받은 숫자
    var number2: String = ""  // 라벨로부터 두번째로 입력받은 숫자
    var numberSet: NumberSet?  // 입력받은 숫자, 연산자를 모두 포함하는 구조체 변수
    var historyArray: [String] = []  // 계산 결과 히스토리 배열(예시: "21 + 2 = 23")
    
    @IBOutlet weak var historyLabel: UILabel!
    
    @IBOutlet weak var resultLabelField: UILabel!
    
    @IBAction func pressNumberButton(_ sender: UIButton) {
        tmpNumber += sender.titleLabel?.text ?? ""  // 숫자 누를 때마다 tmpNumber에 문자열로 저장됨
        resultLabelField.text = tmpNumber           // 누를 때마다 추가된 문자열을 resultLabel에 표시해줌
    }
    
    @IBAction func pressOpButton(_ sender: UIButton) {  // 연산자 버튼
        op = sender.titleLabel?.text ?? "" // 연산자 기호 누를 때 op 변수에 저장됨
        resultLabelField.text = "0"  // 연산자를 누르는 타이밍은 number1 입력받고 누르기 때문에 number2 입력받기 위해서 resultLabel은 다시 0이 표시되도록 한다.
        number1 = tmpNumber  // 연산자를 눌렀다는 얘기는 첫번째 피연산자의 입력이 끝났다는 얘기. 임시 tmp변수에 있는 문자열을 number1에 저장해준다.
        tmpNumber = ""  // 다시 두번째 피연산자를 받을 준비를 한다.
    }
    
    @IBAction func pressResultButton(_ sender: UIButton) {
        number2 = tmpNumber  // '=' 기호를 눌렀으면 두번째 피연산자의 입력도 끝났다는 의미
        numberSet = NumberSet(Float(number1) ?? 0, Float(number2) ?? 0, op ?? "No data") // 피연산자, 연산자를 저장하고 안에서 결과 값까지 계산해서 저장해두는 구조체 타입 변수 초기화
        if let resultNumber = numberSet?.result, let iop = op{  // 옵셔널 바인딩
            resultLabelField.text = resultNumber  // 결과 창에 연산 결과 출력
            historyArray.append("\(number1) \(iop) \(number2) = \(resultNumber)") // 계산 기록을 담는 배열에 연산기록
            historyArray = historyPrint(arrayString: &historyArray, printLabel: historyLabel) // 계산 기록을 출력하는 함수에 배열 매개변수와 라벨타입의 매개변수를 넘겨주고, 계산 기록 라벨에 배열 출력. 그리고 출력 후 갱신된 배열 반환
        }
        tmpNumber = "" // 다음 계산을 위한 준비
    }
    
    @IBAction func pressClearButton(_ sender: Any) {
        number1 = ""
        number2 = ""
        op = ""
        resultLabelField.text = "0"
        tmpNumber = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

