//
//  TabBarView.swift
//  Demo
//
//  Created by 杨明明 on 2018/12/12.
//  Copyright © 2018年 杨明明. All rights reserved.
//

import Foundation
import UIKit

class TabBarView: UITabBarController,UITabBarControllerDelegate{
    
    var items: NSArray = []
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //创建tabar
    func CreatTabar(){
        self.tabBar.barTintColor = UIColor.white
        self.tabBarController?.view.backgroundColor = UIColor.blue
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController:homeVC)
        homeNav.tabBarItem.title = "首页"
        homeNav.tabBarItem.image = UIImage(named:"main")
        homeNav.tabBarItem.selectedImage = UIImage(named:"mainClick")
        homeVC.navigationController?.isNavigationBarHidden = true
        homeVC.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        
        
        let insuranceVC = SecondViewController()
        insuranceVC.title = "查询"
        let insuranceNav = UINavigationController(rootViewController:insuranceVC)
        insuranceNav.tabBarItem.title = "查询"
        insuranceNav.tabBarItem.image = UIImage(named:"Insurance")
        insuranceNav.tabBarItem.selectedImage = UIImage(named:"InsuranceClick")
        insuranceNav.tabBarItem.isEnabled = true
        
        let ThirdVC = ThirdViewController()
        ThirdVC.title = "搜索"
        let ThirdNav = UINavigationController(rootViewController: ThirdVC)
        ThirdNav.tabBarItem.title = "搜索"
        ThirdNav.tabBarItem.image = UIImage(named: "jkj")
        
        
        
        let FourVC = FourthViewController()
        FourVC.title = "设置"
        let FourthNav = UINavigationController(rootViewController: FourVC)
        FourthNav.tabBarItem.title = "设置"
        FourthNav.tabBarItem.image = UIImage(named: "kkk")
        
        
        
        let myVC = MyViewcontroller()
        let myNav = UINavigationController(rootViewController:myVC)
        myNav.tabBarItem.title = "我的"
        myNav.tabBarItem.image = UIImage(named:"My")
        myNav.tabBarItem.selectedImage = UIImage(named:"MyClick")
        myNav.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        myNav.tabBarItem.isEnabled = true
        
        
        
        
        items = [homeNav,insuranceNav,ThirdNav,FourthNav,myNav]
        self.viewControllers = items as? [UIViewController]
    }
}

