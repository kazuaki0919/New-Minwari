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
    
    //　segment用フラグ変数
    var segmentFlag : Int! = 0
    
    //　10のケタ計算用変数
    var tenResultMoney :Int!
    
    //　100のケタ計算用変数
    var hndResultMoney :Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegateをselfに設定
        moneyTextField.delegate = self
        peopleTextField.delegate = self
    }
    
    // 割り勘の桁数選択セグメント
    @IBAction func digitnumSelection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                segmentFlag = 0
                print("フラグ変数：", segmentFlag!)
            case 1:
                segmentFlag = 1
                print("フラグ変数：", segmentFlag!)
            case 2:
                segmentFlag = 2
                print("フラグ変数：", segmentFlag!)
            default:
                print("存在しない番号")
        }
    }
    
    // 割り勘ボタン
    @IBAction func touchButton(_ sender: Any) {
        print("生の金額：", moneyTextField.text!)
        print("生の人数：", peopleTextField.text!)
        
        //　エラーのアラート表示
        if (moneyTextField.text! == "") || (peopleTextField.text! == "") {
            // 未入力の項目がある時のアラート表示
            let alert = UIAlertController(title: "入力エラー", message: "未入力の項目があります。\nもう一度確かめてください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else if (moneyTextField.text! == "0") || (peopleTextField.text! == "0") {
            // どちらかの値が0のときのアラート表示
            let alert = UIAlertController(title: "値エラー", message: "値”0”が入力されています。\nもう一度確かめてください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {  // 正常の時は計算する
            // 計算処理
            calculating_process()
            
            // キーボードをしまう
            self.view.endEditing(true)
        }
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
        
        //桁数処理
        switch segmentFlag {
            case 0:  // 1の桁で計算
                // 計算処理
                resultMoney = moneyNum / peopleNum
                moneyLabel.text = String(resultMoney!)
                print("計算結果：", resultMoney!)
                
                // 端数処理
                fracNum = moneyNum % peopleNum
                fracLabel.text = String(fracNum!)
                print("端数：", fracNum!)
            case 1:  // 10の桁で計算
                // 計算処理
                tenResultMoney = moneyNum / peopleNum
                resultMoney = tenResultMoney - (tenResultMoney % 10)
                moneyLabel.text = String(resultMoney!)
                print("計算結果：", resultMoney!)
                
                // 端数処理
                fracNum = moneyNum - (resultMoney * peopleNum)
                fracLabel.text = String(fracNum!)
                print("端数：", fracNum!)
            case 2:  // 100の桁で計算
            // 計算処理
            hndResultMoney = moneyNum / peopleNum
            resultMoney = hndResultMoney - (tenResultMoney % 100)
            moneyLabel.text = String(resultMoney!)
            print("計算結果：", resultMoney!)
            
            // 端数処理
            fracNum = moneyNum - (resultMoney * peopleNum)
            fracLabel.text = String(fracNum!)
            print("端数：", fracNum!)
            default:
                // 計算エラーのときのアラート表示
                let alert = UIAlertController(title: "計算エラー", message: "計算がうまくいきませんでした。\nもう一度確かめてください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
        }
    }
}

