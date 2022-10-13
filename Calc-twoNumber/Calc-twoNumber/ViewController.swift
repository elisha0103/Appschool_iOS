//
//  ViewController.swift
//  Calc-twoNumber
//
//  Created by 진태영 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    enum Operator{
        case plus
        case minus
        case multi
        case division
    }
    
    var operationName: Operator = .plus
    
    @IBOutlet weak var numberTextField1: UITextField!
    
    @IBOutlet weak var numberTextField2: UITextField!
    
    @IBOutlet weak var operatorLabelField: UILabel!
    
    
    @IBOutlet weak var resultLabelField: UILabel!
    
    @IBAction func plusButton(_ sender: Any) {
        
        operationName = .plus
        operatorLabelField.text = "➕"
        
    }
    
    @IBAction func minusButton(_ sender: Any) {
        operationName = .minus
        operatorLabelField.text = "➖"

    }
    
    @IBAction func multiButton(_ sender: Any) {
        operationName = .multi
        operatorLabelField.text = "✖️"

    }
    
    @IBAction func divisionButton(_ sender: Any) {
        operationName = .division
        operatorLabelField.text = "➗"

    }
    
    @IBAction func resultButton(_ sender: Any) {
        let stringNum1: String = numberTextField1.text ?? ""
        let stringNum2: String = numberTextField2.text ?? ""
        let numString1: Int = Int(stringNum1) ?? 0
        let numString2: Int = Int(stringNum2) ?? 0
        var resultString: String = ""
        switch operationName {
        case .plus:
            resultString = String(numString1 + numString2)
        case .minus:
            resultString = String(numString1 - numString2)
        case .multi:
            resultString = String(numString1 * numString2)
        case .division:
            if numString2 == 0{
                resultString = "Exit"
                break
            }
            resultString = String(numString1 / numString2)
        default: break
            
        }
        
        resultLabelField.text = resultString
        
        synthesizer.speak(AVSpeechUtterance(string: resultString))
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

