//
//  ViewController.swift
//  New Minwari
//
//  Created by 並木一晃 on 2023/01/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // 金額Field
    @IBOutlet var moneyTextField: UITextField!
    var inputMoney :String!   //TextFieldの値
    var moneyNum :Int!   //Int型に変換した値
 
    // 人数Field
    @IBOutlet var peopleTextField: UITextField!
    var inputPeople :String!   //TextFieldの値
    var peopleNum :Int!   //Int型に変換した値
    
    // 金額表示ラベル
    @IBOutlet var moneyLabel: UILabel!
    var resultMoney :Int! = 0
    
    // 端数表示ラベル
    @IBOutlet var fracLabel: UILabel!
    var fracNum :Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegateをselfに設定
        moneyTextField.delegate = self
        peopleTextField.delegate = self
        
        
    }
    
    @IBAction func touchButton1(_ sender: Any) {
        print("生の金額：", moneyTextField.text!)
        print("生の人数：", peopleTextField.text!)
        
        // 計算処理
        calculating_process()
    }
    
    
    // 計算処理
    func calculating_process() {
        //金額
        //TextFieldから値をインポートする
        inputMoney = moneyTextField.text!
        print("インプットした金額：", inputMoney!)
        //String型をIntに変換
        moneyNum = Int(inputMoney)
        print("変換した金額：", moneyNum!)
        // 人数
        //TextFieldから値をインポートする
        inputPeople = peopleTextField.text!
        print("インプットした人数：", inputPeople!)
        //String型をIntに変換
        peopleNum = Int(inputPeople)
        print("変換した人数：", peopleNum!)

        // 計算処理
        resultMoney = moneyNum / peopleNum
        moneyLabel.text = String(resultMoney!)
        print("計算結果：", resultMoney!)
        
        // 端数処理
        fracNum = moneyNum % peopleNum
        fracLabel.text = String(fracNum!)
        print("端数：", fracNum!)
    }
}

