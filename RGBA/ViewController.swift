//
//  ViewController.swift
//  RGBA
//
//  Created by インターンシップ用アカウント on 2018/02/15.
//  Copyright © 2018年 iacorporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Color_label: UILabel!
    var red:CGFloat=0.5
    var green:CGFloat=0.5
    var blue:CGFloat=0.5
    var alpha:CGFloat=0.5
    @IBOutlet weak var a: UISlider!
    @IBOutlet weak var b: UISlider!
    @IBOutlet weak var c: UISlider!
    @IBOutlet weak var d: UISlider!
    
   
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //保存されてる値があるか調べる
        input_color()
        //uisliderの初期化
        a.value=Float(CGFloat(red))
        b.value=Float(CGFloat(green))
        c.value=Float(CGFloat(blue))
        d.value=Float(CGFloat(alpha))
        print("初期化２",a.value,b.value,c.value,d.value)
        //色のラベルの初期化
        Color_label.backgroundColor=UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    //UIslidernでRGBAの値を調節する。
    @IBAction func RGBA_slider(_ sender: UISlider) {
        if(sender.tag==0){//赤色の調節
           // print(sender.tag)
            print(sender.value)
            red=CGFloat(sender.value)
        }else if(sender.tag==1){//緑色の調節
          //  print(sender.tag)
            print(sender.value)
            green=CGFloat(sender.value)
        }else if(sender.tag==2){//青色の調節
          //  print(sender.tag)
           print(sender.value)
            blue=CGFloat(sender.value)
        }else if(sender.tag==3){//透明度の調節
          //  print(sender.tag)
            print(sender.value)
            alpha=CGFloat(sender.value)
        }
        //色のラベルの背景色の更新
        Color_label.backgroundColor=UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    //全てを初期化する
    @IBAction func clear(_ sender: UIButton) {
        userDefaults.set(0.5,forKey:"red")
        userDefaults.set(0.5,forKey:"green")
        userDefaults.set(0.5,forKey:"blue")
        userDefaults.set(0.5,forKey:"alpha")
        red=0.5
        green=0.5
        blue=0.5
        alpha=0.5
        a.value=0.5
        b.value=0.5
        c.value=0.5
        d.value=0.5
        //色のラベルの背景色の更新
        Color_label.backgroundColor=UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        print("clear",CGFloat(userDefaults.float(forKey: "red")),CGFloat(userDefaults.float(forKey: "green")),CGFloat(userDefaults.float(forKey: "blue")),CGFloat(userDefaults.float(forKey: "alpha")))
    }
    //確定した値を保存する
    @IBAction func storage(_ sender: UIButton) {
         userDefaults.set(red,forKey:"red")
         userDefaults.set(green,forKey:"green")
         userDefaults.set(blue,forKey:"blue")
         userDefaults.set(alpha,forKey:"alpha")
        print("保存",CGFloat(userDefaults.float(forKey: "red")),CGFloat(userDefaults.float(forKey: "green")),CGFloat(userDefaults.float(forKey: "blue")),CGFloat(userDefaults.float(forKey: "alpha")))
        
       
    }
    
    
}

