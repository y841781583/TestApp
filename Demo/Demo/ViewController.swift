//
//  ViewController.swift
//  Demo
//
//  Created by 杨明明 on 2018/12/12.
//  Copyright © 2018年 杨明明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backgroundAnim:BackgroudView! = nil   //背景动画
    var label1 = UILabel.init()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        label1.backgroundColor = UIColor.blue
        label1.text = "我不是反賳"
        label1.textAlignment = NSTextAlignment.center
        self.view.addSubview(label1)
        label1.mas_makeConstraints { (make:MASConstraintMaker!)in
            
            make!.left.mas_equalTo()(15)
            
            make.right.mas_equalTo()(self.view.mas_right)?.setOffset(-15)
            
            make.height.mas_equalTo()(45)
            
            make.top.mas_equalTo()(300)
            
        }
//            let dic : [String:Any] = ["code":"1",  "msg":["code1":"2","code2":"2"]]
//
//            //把code2对应的value "2"取出来
//            let dic1 = dic["msg"] as? NSDictionary
//            let dic3 = dic1!["code2"] as? String
//            print(dic3)
//            let sss = dic1?.object(forKey: "code2")
//            print(sss ?? "")
//            print(dic1 as Any)
//
//            let arr = dic1![0]
//            print(arr)
        
        
        
        
        let backImageView = UIImageView.init(image: UIImage.init(named: "background"))
        backImageView.frame = CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height)
        self.view.addSubview(backImageView)
        
        /*动画背景*/
        self.backgroundAnim = BackgroudView.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:0))   //背景动画
        self.backgroundAnim.isUserInteractionEnabled = false
        self.view.addSubview(self.backgroundAnim)
        
        
        let pushBTN = UIButton.init(frame: CGRect(x:100 , y:600, width:150,height:50))
//        pushBTN.backgroundColor = .black
        pushBTN.setTitle("登  录", for: .normal)
        pushBTN.addTarget(self, action: #selector(back(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pushBTN)
        
        var arr = [UIImage]()
        let w : CGFloat = 50
        for i in 0 ..< 30 {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: w, height: w), false, 0)
            let context = UIGraphicsGetCurrentContext()!
            context.setFillColor(UIColor.gray.cgColor)
            let ii = CGFloat(i)
            let rect = CGRect(x: ii, y:ii, width: w-ii*2, height: w-ii*2)
            context.addEllipse(in: rect)
            context.fillPath()
            let im = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            arr.append(im)
        }
        let im = UIImage.animatedImage(with: arr, duration: 0.5)
        pushBTN.setImage(im, for: .normal)
    }
    
    
    @objc func back(sender:UIButton?){
        let tabview = TabBarView()
        tabview.CreatTabar()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: tabview)
        
//        label1.backgroundColor = .blue
//        label1.text = "我是反贼"
        
        let lab2 = UILabel(frame: label1.frame)
        self.view.addSubview(lab2)
        lab2.text = "fdasfads"
        lab2.textColor = UIColor.red
//        lab2.sizeToFit()
        UIView.transition(from: label1 , to: lab2 , duration: 0.5 , options: .transitionFlipFromLeft , completion: { _ in
            self.label1 = lab2
        })
    }
}


