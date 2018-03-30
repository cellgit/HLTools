//
//  CalendarViewController.swift
//  CampusSafety
//
//  Created by liuhongli on 2018/3/29.
//  Copyright © 2018年 CampusSafety. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    let outsideMonthColor = UIColor.gray
    let monthColor = UIColor.black
    let selectedMonthColor = UIColor.white
    let currentDateSelectedViewColor = UIColor.white
    @IBOutlet weak var calendarCollectionView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var yearToMonth: UILabel!
    @IBOutlet weak var previousMonth: UIButton!
    @IBOutlet weak var nextMonth: UIButton!
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendarView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCalendarView() {
        calendarCollectionView.minimumLineSpacing = 0
        calendarCollectionView.minimumInteritemSpacing = 0
        calendarCollectionView.visibleDates { (visibleDates) in
            self.setupViewOfCalendar(from: visibleDates)
        }
    }
    func handleCellVisibility(cell:SWCalendarCell, cellState:CellState) {
        cell.isHidden = cellState.dateBelongsTo == .thisMonth ? false : true
    }
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? SWCalendarCell else {return}
        if validCell.isSelected {
            validCell.dateLabel.textColor = selectedMonthColor
        }
        else{
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColor
            }
            else {
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? SWCalendarCell else {return}
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        }
        else {
            validCell.selectedView.isHidden = true
        }
    }
    func setupViewOfCalendar(from visibleDates:DateSegmentInfo) {
        guard let date = visibleDates.monthDates.first?.date else {return}
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from: date)
        self.formatter.dateFormat = "MM月dd日"
        self.month.text = self.formatter.string(from: date)
        self.formatter.dateFormat = "yyyy年 MM月"
        self.yearToMonth.text = self.formatter.string(from: date)
    }
    // confirm or cancel action
    @IBAction func confirmAction(_ sender: Any) {
        //TODO： 在这里获取日期，传递到上一级控制器
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func previousMonthAction(_ sender: Any) {
        //TODO:
    }
    @IBAction func nextMonthAction(_ sender: Any) {
        //TODO:
    }
}

extension CalendarViewController: JTAppleCalendarViewDataSource{
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "2017 01 01")
        let endDate = formatter.date(from: "2019 01 01")
        let parm = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parm
    }
}
extension CalendarViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "SWCalendarCell", for: indexPath) as! SWCalendarCell
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
        handleCellVisibility(cell: cell, cellState: cellState)
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.red.cgColor
        cell.dateLabel.text = cellState.text
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewOfCalendar(from: visibleDates)
    }
}


