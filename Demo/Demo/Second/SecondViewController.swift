//
//  SecondViewController.swift
//  Demo
//
//  Created by 杨明明 on 2018/12/12.
//  Copyright © 2018年 杨明明. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    var catalog = [[String]]()
    var tableView:UITableView!
    
    override func viewDidLoad() {
        self.view.backgroundColor = .blue
        
        //初始化列表数据
        catalog.append(["第一节：Swift 环境搭建", "img1.jpg"])
        catalog.append(["第二节：Swift 基本语法（类型定义、循环遍历、判断、继承）", "img2.jpg"])
        catalog.append(["第三节：Swift 数据类型", "img3.jpg"])
        
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //创建一个重用的单元格
        self.tableView!.register(UINib(nibName:"ImageTableViewCell", bundle:nil),
                                 forCellReuseIdentifier:"myCell")
        
        //设置estimatedRowHeight属性默认值
        self.tableView.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        self.view.addSubview(self.tableView!)
        
        //        let pushBTN = UIButton.init(frame: CGRect(x:90 , y:190, width:100,height:100))
        //        pushBTN.backgroundColor = .black
        //        pushBTN.setTitle("哈哈哈哈哈，你到消息列表", for: .normal)
        //        pushBTN.addTarget(self, action: #selector(back(sender:)), for: UIControlEvents.touchUpInside)
        //        self.view.addSubview(pushBTN)
        
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return self.catalog.count
//    }
    
    
    //在本例中，只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalog.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //同一形式的单元格重复使用
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",
                                                     for: indexPath) as! ImageTableViewCell
            //获取对应的条目内容
            let entry = catalog[indexPath.row]
            //单元格标题和内容设置
            cell.label.text = entry[0]
//            cell.loadImage(name: entry[1])
            return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func back(sender:UIButton?){
        let tabview = TabBarView()
        tabview.CreatTabar()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: tabview)
    }
    
}
