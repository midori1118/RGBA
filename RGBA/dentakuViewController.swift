//
//  dentakuViewController.swift
//  RGBA
//
//  Created by インターンシップ用アカウント on 2018/02/15.
//  Copyright © 2018年 iacorporation. All rights reserved.
//

import UIKit

class dentakuViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    var first:Int=0
    var second:Int=0
    var red:CGFloat=0.5
    var green:CGFloat=0.5
    var blue:CGFloat=0.5
    var alpha:CGFloat=0.5
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        first=0
        second=0
      
        input_color()
        print("viewDidLoad")
        //色のラベルの初期化
        result.backgroundColor=UIColor(red: red, green: green, blue: blue, alpha: alpha)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func value(_ sender: UIButton) {
        first=first*10
        first=first+Int(sender.titleLabel!.text!)!
        result.text=String(first)
       // keisan.append(String(first))
    }
    
   
    @IBAction func plus(_ sender: UIButton) {
       
        
        second+=first
       
        first=0
        result.text=sender.titleLabel!.text!
    
    }
    @IBAction func equal(_ sender: UIButton) {
        result.text=String(first+second)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        first=0
        second=0
        result.text=""
    }
    //値の初期化
    func input_color(){
        
        if(userDefaults.object(forKey:"red")==nil){//もし値が保存されていなかったら初期値0.5を代入
            userDefaults.set(0.5,forKey:"red")
            red=CGFloat(userDefaults.float(forKey: "red"))
        }else{//値が保存されていたらその値を代入
            print(userDefaults.float(forKey: "red"))
            red=CGFloat(userDefaults.float(forKey: "red"))
            print("red",red)
        }
        
        if(userDefaults.object(forKey:"green")==nil){
            userDefaults.set(0.5,forKey:"green")
            green=CGFloat(userDefaults.float(forKey: "green"))
        }else{
            green=CGFloat(userDefaults.float(forKey: "green"))
            print("green",green)
        }
        
        if(userDefaults.object(forKey:"blue")==nil){
            userDefaults.set(0.5,forKey:"blue")
            blue=CGFloat(userDefaults.float(forKey: "blue"))
        }else{
            blue=CGFloat(userDefaults.float(forKey: "blue"))
            print("blue",blue)
        }
        
        if(userDefaults.object(forKey:"alpha")==nil){
            userDefaults.set(0.5,forKey:"alpha")
            alpha=CGFloat(userDefaults.float(forKey: "alpha"))
        }else{
            alpha=CGFloat(userDefaults.float(forKey: "alpha"))
            print("alpha",alpha)
        }
        print("初期値",red,green,blue,alpha)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
