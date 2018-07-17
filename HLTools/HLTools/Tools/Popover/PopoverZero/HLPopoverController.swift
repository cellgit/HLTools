//
//  HLPopoverController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/9.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

struct HLPopoverDataStruct {
    var title: String = ""
    var identifier: String = ""
    // 字典的内容用于回调传值,即从外部传到popover,再从popover传到外部,中间字典不做任何事情,便于复用
    var dict = [String : String]()
}
struct HLPopoverStruct {
    var dataList = [HLPopoverDataStruct]()
    var identifier: String = ""
    var tableSize: CGSize = CGSize(width: 150, height: 50*2)
}
//点击cell获取到的数据,根据 identifier 判断点击的是哪个数据模型
protocol HLPopoverCallbackDelegate {
    func callbackAction(data: HLPopoverDataStruct)
}

extension HLPopoverController {
    convenience init(param: HLPopoverStruct) {
        self.init()
        self.dataList = param.dataList
        self.tableSize = param.tableSize
    }
}

class HLPopoverController: UIViewController {
    /// 点击 tableViewCell 时的回调代理
    open var delegate: HLPopoverCallbackDelegate?
    open var backgroundColor: UIColor = UIColor.white
    open var titleColor: UIColor = UIColor.gray
    open var font: UIFont = UIFont.systemFont(ofSize: 15)
    open var tableSize: CGSize = CGSize(width: 150, height: 44*2)
    open var isHighlight: Bool = true   //点击 cell 是否高亮, default is true
    open var cellHeight: CGFloat = 50
    open var tableWidth: CGFloat = 150
    
    let KHLPopoverCell = "HLPopoverCell"
    var tableView: UITableView!
    private var dataList  = [HLPopoverDataStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width:tableSize.width, height:tableSize.height), style: .grouped)
        tableView.backgroundColor = UIColor.init(red: 240.0/255.0, green: 241.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        self.view.addSubview(tableView)
//        tableView.separatorStyle = .none
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.contentInset = UIEdgeInsetsMake(-38, 0, 0, 0)
        } else {}
        tableView.separatorInset = UIEdgeInsetsMake(0, -30, 0, -0)
        tableView.showsVerticalScrollIndicator = false
        let arrayM = [KHLPopoverCell]
        for str in arrayM {
            tableView.register(UINib(nibName:str, bundle:nil), forCellReuseIdentifier:str)
        }
        tableView.backgroundColor = ThemeColor
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
}

extension HLPopoverController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HLPopoverCell = tableView.dequeueReusableCell(withIdentifier: KHLPopoverCell, for: indexPath) as! HLPopoverCell
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        cell.titleLabel.text = self.dataList[indexPath.row].title
        cell.titleLabel.font = self.font
        cell.backgroundColor = self.backgroundColor
        if isHighlight == false {
            cell.selectionStyle = .none //设置选中非高亮
        }
        else {
            cell.selectionStyle = .default
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.callbackAction(data: self.dataList[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

