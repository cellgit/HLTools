//
//  EmptyTableViewSample.swift
//  CampusSafety
//
//  Created by liuhongli on 2018/4/20.
//  Copyright © 2018年 CampusSafety. All rights reserved.
//


/*
 let label = UILabel().then {
 $0.textAlignment = .center
 $0.textColor = .black
 $0.text = "Hello, World!"
 }
 */



import UIKit

class EmptyTableViewSample: UIViewController {
    
    let KUITableViewCell = "UITableViewCell"
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setTableViewUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTableViewUI() {
        tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = false
//        tableView.separatorStyle = .none    // 设置tableViewCell 分割线
        tableView.separatorInset = UIEdgeInsetsMake(0, -15, 0, 0)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {}
        
//        /// Xib 注册方法
//        let arrayM = [KUITableViewCell]
//        for str in arrayM {
//            self.tableView!.register(UINib(nibName:str, bundle:nil),
//                                     forCellReuseIdentifier:str)
//        }
        
        // 纯代码注册方法
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: KUITableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension EmptyTableViewSample: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: KUITableViewCell, for: indexPath) 
        cell.layer.shouldRasterize = true
        cell.textLabel?.text = "\(indexPath.section)-\(indexPath.row)"
        cell.layer.rasterizationScale = UIScreen.main.scale
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0))
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0))
        return view
    }
}





