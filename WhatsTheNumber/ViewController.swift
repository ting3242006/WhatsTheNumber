//
//  ViewController.swift
//  WhatsTheNumber
//
//  Created by Ting on 2021/9/22.
//

import UIKit

class ViewController: UIViewController {
    //做一個亂數
    var answer = Int.random(in: 1...100)
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
     
    @IBOutlet weak var inputTextField: UITextField!

    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false{
            //正在玩遊戲
            print(answer)
            
            //take input text out
            let inputText = inputTextField.text!
            print("input text = \(inputText)")
            //按guess清空text field
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            
            if inputNumber == nil{
                //no input
                messageLabel.text = "請輸入 \(minNumber)-\(maxNumber)的數字"
            }else{
                //got input
                if inputNumber! > maxNumber{
                    //user input too large
                    messageLabel.text = "數字太大了，請輸入 \(minNumber)-\(maxNumber)的數字"
                }else if inputNumber! < minNumber{
                    //user input too small
                    messageLabel.text = "數字太小了，請輸入 \(minNumber)-\(maxNumber)的數字"
                }else{
                    //check answer
                    if inputNumber! == answer{
                        //right answer
                        messageLabel.text = "答對了🥳按Guess再玩一次"
                        isOver = true
                    }else{
                        //wrong answer
                        if inputNumber! > answer{
                            //large than answer
                            maxNumber = inputNumber!
                        }else{
                            //small than number
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "再試一次，選擇\(minNumber)-\(maxNumber)"
                    }
                }
            }
        }else{
            //遊戲結束
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "請輸入 \(minNumber)-\(maxNumber)的數字"
            answer = Int.random(in: 1...100)
            isOver = false
        }
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // push the keyboard up
        inputTextField.becomeFirstResponder()
    }

    
    
    
    
}

