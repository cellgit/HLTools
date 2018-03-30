//
//  ViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/25.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let cellId:String = "cellId"
    var tableView:UITableView!
    var dataArray:Array = ["进度君",
                           "日历君",
                           "相册君",
                           "警示君",
                           "弹框君",
                           "待续... ..."]
    
    let shapelayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        setupTableView()
    }
    
    func configuration() {
        self.title = "小控件"
    }
    
    
    
    func setupTableView() {
        
        tableView = UITableView.init(frame: self.view.frame, style: .plain)
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self;
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = "row \(indexPath.row) : --  \(dataArray[indexPath.row])"
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let vc:HLProgressBarViewController = HLProgressBarViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}


extension ViewController {
    func pushViewController(vc:UIViewController, animated:Bool) {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    
    
    
}

