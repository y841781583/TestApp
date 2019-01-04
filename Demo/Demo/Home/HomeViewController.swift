//
//  HomeViewController.swift
//  Demo
//
//  Created by 杨明明 on 2018/12/12.
//  Copyright © 2018年 杨明明. All rights reserved.
//

import UIKit
import CoreImage

class HomeViewController: UIViewController{
    var newsbtn = UIButton.init()
    var newsbtn1 = UIButton.init()
    
    
    override func loadView() {
        super.loadView()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        newsbtn.setBackgroundImage(UIImage(named: "消息"), for: .normal)
        self.view.addSubview(newsbtn)
        newsbtn.mas_makeConstraints { (make) in
            make?.size.setSizeOffset(CGSize(width: 30, height: 50))
            make?.right.mas_equalTo()(self.view.mas_right)?.setOffset(-30)
            make?.top.mas_equalTo()(self.view.mas_top)?.setOffset(70)
        }
        newsbtn.addTarget(self, action: #selector(ToNews(sennder:)), for: .touchUpInside)
        
        
        newsbtn1.setBackgroundImage(UIImage(named: "消息"), for: .normal)
        self.view.addSubview(newsbtn1)
        newsbtn1.mas_makeConstraints { (make) in
            make?.size.setSizeOffset(CGSize(width: 30, height: 50))
            make?.right.mas_equalTo()(self.view.mas_right)?.setOffset(-30)
            make?.top.mas_equalTo()(self.view.mas_top)?.setOffset(70)
        }
        newsbtn1.addTarget(self, action: #selector(ToNews(sennder:)), for: .touchUpInside)
        
    }
    
    
    @objc func ToNews(sennder:UIButton){
        
    }
    
}
