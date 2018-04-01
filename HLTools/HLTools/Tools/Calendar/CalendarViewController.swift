//
//  CalendarViewController.swift
//  CampusSafety
//
//  Created by liuhongli on 2018/3/29.
//  Copyright © 2018年 CampusSafety. All rights reserved.
//

import UIKit
import JTAppleCalendar


protocol SWCalendarDelegate {
    func getSelectedDate(selectedDate:Date)
}


class CalendarViewController: UIViewController {
    
    open var delegate: SWCalendarDelegate?
    
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
    
    let todaysDate = Date()
    var selectedDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        calendarCollectionView.scrollToDate( Date(), animateScroll:false)
        calendarCollectionView.selectDates([Date()])    // 设置 todaysDate
        
        
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
    func handleCellVisibility(cell:SWCalendarCell?, cellState:CellState) {
        cell?.isHidden = cellState.dateBelongsTo == .thisMonth ? false : true
    }
    func handleCellTextColor(cell: SWCalendarCell?, cellState: CellState) {
        
        formatter.dateFormat = "yyyy MM dd"
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        if todaysDateString == monthDateString {
            cell?.dateLabel.textColor = UIColor.magenta
        }
        else {
            cell?.dateLabel.textColor = cellState.isSelected ? selectedMonthColor : monthColor
        }
        
    }
    
    func handleCellSelected(cell: SWCalendarCell?, cellState: CellState) {
        guard let validCell = cell else {return}
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        }
        else {
            validCell.selectedView.isHidden = true
        }
        
    }
    
    func getCellSelected(cell: SWCalendarCell?, cellState: CellState) {
        // 如果没选中,则默认为当前
        selectedDate = cellState.date
    }
    
    func setupViewOfCalendar(from visibleDates:DateSegmentInfo) {
        guard let date = visibleDates.monthDates.first?.date else {return}
//        self.formatter.dateFormat = "yyyy"
//        self.year.text = self.formatter.string(from: date)
//        self.formatter.dateFormat = "MM月dd日"
//        self.month.text = self.formatter.string(from: date)
        self.formatter.dateFormat = "yyyy年 MM月"
        self.yearToMonth.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "yyyy"
        let todaysYearString = formatter.string(from: todaysDate)
        self.year.text = todaysYearString
        self.formatter.dateFormat = "MM月dd日"
        let todaysMonthString = formatter.string(from: todaysDate)
        self.month.text = todaysMonthString
    }
    // confirm or cancel action
    @IBAction func confirmAction(_ sender: Any) {
        delegate?.getSelectedDate(selectedDate: self.selectedDate)
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
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
        handleCellVisibility(cell: cell, cellState: cellState)
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.red.cgColor
        cell.dateLabel.text = cellState.text
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(cell: cell as? SWCalendarCell, cellState: cellState)
        handleCellSelected(cell: cell as? SWCalendarCell, cellState: cellState)
        
        print("selectedDate:\(cellState.date)")
        print("selectedDateString:\(formatter.string(from: cellState.date))")
        getCellSelected(cell: cell as? SWCalendarCell, cellState: cellState)
        cell?.bounce()
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(cell: cell as? SWCalendarCell, cellState: cellState)
        handleCellSelected(cell: cell as? SWCalendarCell, cellState: cellState)
        
    }
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewOfCalendar(from: visibleDates)
        
        // TODO:有bug
        self.calendarCollectionView.reloadData()
        calendarCollectionView.selectDates([selectedDate])
    }
}


extension UIView {
    func bounce() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5,
                       delay: 0, usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.1,
                       options: UIViewAnimationOptions.beginFromCurrentState,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
}


