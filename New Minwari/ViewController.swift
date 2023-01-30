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
    
    @IBAction func touchButton(_ sender: Any) {
        print("生の金額：", moneyTextField.text!)
        print("生の人数：", peopleTextField.text!)
        
        //ここの処理から追加
        if (moneyTextField.text! == "") || (peopleTextField.text! == "") {
            let alert = UIAlertController(title: "計算エラー", message: "未入力の項目があります。\nもう一度確かめてください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
        } else {
            // 計算処理
            calculating_process()
            
            // キーボードをしまう
            self.view.endEditing(true)
        }
        //ここまで
        
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        // 変数初期化
        (inputMoney, moneyNum) = ("", 0)
        (inputPeople, peopleNum) = ("", 0)
        resultMoney = 0
        fracNum = 0
        
        // TextFieldの初期化
        moneyTextField.text! = ""
        peopleTextField.text! = ""
        
        //　初期化がの変数をラベルに表示
        moneyLabel.text = String(resultMoney!)
        fracLabel.text = String(fracNum!)
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

