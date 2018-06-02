//
//  HLTimerManager.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

//class HLTimerManager: NSObject {
//
//}

/*
 注：使用方法
 传入参数（枚举）：HLDateFormat.Year 或 HLDateFormat.Month等，显示不同样式
 
 class ViewController: UIViewController{
 let timerManager = HLTimerManager()
 
 用法一：获取当前时间
 let currentTime:String = self.timerManager.getCurrentTime(dateFormat: HLDateFormat.Year)
 或者：let currentTime: String = HLTimerManager.shared.getCurrentTime(dateFormat: HLDateFormat.YearToDay)
 
 用法二：实时显示当前时间
 func createTimer() {
 timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
 if self.timeLabel != nil {
 // 实时显示当前时间
 self.timeLabel.text = self.timerManager.getCurrentTime(dateFormat: HLDateFormat.Year)
 }
 })
 }
 }
 或者 单例
 
 用法三：指定时间格式转换：传入时间戳的字符串即可
 func dateFormat(timeStamp:String) -> String {
 let formatTime:String = timerManager.getFormatTime(dateFormat: HLDateFormat.Hour, timeStamp: timeStamp)
 return formatTime
 }
 let formatTime:String = dateFormat(timeStamp: (attendanceModel?.now_time)!)
 formatTime 即为转化后的时间格式
 或者 单例
 
 */

import UIKit

extension HLTimerManager {
    /// 当前时间获取
    open func getCurrentTime(dateFormat:HLDateFormat) -> String {
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let currentTime:String = getTime(dateFormat: dateFormat, timeInterval: timeInterval)
        return currentTime
    }
    /// 指定时间格式转换
    open func getFormatTime(dateFormat:HLDateFormat, timeStamp: String) -> String {
        let timeInterval = TimeInterval(timeStamp)
        let formatTime:String = getTime(dateFormat: dateFormat, timeInterval: timeInterval!)
        return formatTime
    }
    
    /// Date格式转换成时间戳格式（2018-04-11 06:49:52 +0000 -> 17777777777）
    func getStampFormat(date: Date) -> String {
        let timeInterval:TimeInterval = date.timeIntervalSince1970
        let timeStamp = String(timeInterval)
        return timeStamp
    }
}

enum HLDateFormat {
    case Year           // yyyy年MM月dd日 HH:mm:ss
    case Month          // MM月dd日 HH:mm:ss
    case Day            // dd日 HH:mm:ss
    case Hour           // HH:mm:ss
    case Minute         // mm:ss
    case Second         // ss
    case YearToYear     // yyyy年
    case YearToMonth    // yyyy年MM月
    case YearToDay      // yyyy年MM月dd日
    case YearToHour     // yyyy年MM月dd日 HH时
    case YearToMinute   // yyyy年MM月dd日 HH:mm
    case MonthToMonth   // MM月
    case MonthToDay     // MM月dd日
    case MonthToHour    // MM月dd日 HH时
    case MonthToMinute  // MM月dd日 HH:mm
    case DayToDay       // dd日
    case DayToHour      // dd日 HH时
    case DayToMinute    // dd日 HH:mm
    case HourToHour     // HH
    case HourToMinute   // HH:mm
    case MinuteToMinute // mm
    
    case TimYear           // yyyy-MM-dd HH:mm:ss
    case TimMonth          // MM-dd HH:mm:ss
    case TimDay            // dd HH:mm:ss
    case TimYearToYear     // yyyy
    case TimYearToMonth    // yyyy-MM
    case TimYearToDay      // yyyy-MM-dd
    case TimYearToHour     // yyyy-MM-dd HH
    case TimYearToMinute   // yyyy-MM-dd HH:mm
    case TimMonthToMonth   // MM
    case TimMonthToDay     // MM-dd
    case TimMonthToHour    // MM-dd HH
    case TimMonthToMinute  // MM-dd HH:mm
    case TimDayToDay       // dd
    case TimDayToHour      // dd HH
    case TimDayToMinute    // dd日 HH:mm
    
    case TimeStamp      // 时间戳
}

class HLTimerManager: NSObject {
    static let shared:HLTimerManager = HLTimerManager()
    
    //    static func shared() -> HLTimerManager {
    //        let instance = HLTimerManager()
    //        return instance
    //    }
    
    func getTime(dateFormat:HLDateFormat, timeInterval:TimeInterval) -> String {
        //获取当前时间
        //        let now = Date()
        //日期格式器
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        //当前时间的时间戳
        //        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        //转换为时间
        let date = Date(timeIntervalSince1970: timeInterval)
        switch dateFormat {
        case HLDateFormat.Year:
            dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        case HLDateFormat.Month:
            dateformatter.dateFormat = "MM月dd日 HH:mm:ss"
        case HLDateFormat.Day:
            dateformatter.dateFormat = "dd日 HH:mm:ss"
        case HLDateFormat.Hour:
            dateformatter.dateFormat = "HH:mm:ss"
        case HLDateFormat.Minute:
            dateformatter.dateFormat = "mm:ss"
        case HLDateFormat.Second:
            dateformatter.dateFormat = "ss"
        case HLDateFormat.YearToYear:
            dateformatter.dateFormat = "yyyy年"
        case HLDateFormat.YearToMonth:
            dateformatter.dateFormat = "yyyy年MM月"
        case HLDateFormat.YearToDay:
            dateformatter.dateFormat = "yyyy年MM月dd"
        case HLDateFormat.YearToHour:
            dateformatter.dateFormat = "yyyy年MM月dd日 HH时"
        case HLDateFormat.YearToMinute:
            dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        case HLDateFormat.MonthToMonth:
            dateformatter.dateFormat = "MM月"
        case HLDateFormat.MonthToDay:
            dateformatter.dateFormat = "MM月dd日"
        case HLDateFormat.MonthToHour:
            dateformatter.dateFormat = "MM月dd日 HH时"
        case HLDateFormat.MonthToMinute:
            dateformatter.dateFormat = "MM月dd日 HH:mm"
        case HLDateFormat.DayToDay:
            dateformatter.dateFormat = "dd日"
        case HLDateFormat.DayToHour:
            dateformatter.dateFormat = "dd日 HH时"
        case HLDateFormat.DayToMinute:
            dateformatter.dateFormat = "dd日 HH:mm"
        case HLDateFormat.HourToHour:
            dateformatter.dateFormat = "HH"
        case HLDateFormat.HourToMinute:
            dateformatter.dateFormat = "HH:mm"
        case HLDateFormat.MinuteToMinute:
            dateformatter.dateFormat = "mm"
            
        case HLDateFormat.TimYear:
            dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        case HLDateFormat.TimMonth:
            dateformatter.dateFormat = "MM-dd HH:mm:ss"
        case HLDateFormat.TimDay:
            dateformatter.dateFormat = "dd HH:mm:ss"
        case HLDateFormat.TimYearToYear:
            dateformatter.dateFormat = "yyyy"
        case HLDateFormat.TimYearToMonth:
            dateformatter.dateFormat = "yyyy-MM"
        case HLDateFormat.TimYearToDay:
            dateformatter.dateFormat = "yyyy-MM-dd"
        case HLDateFormat.TimYearToHour:
            dateformatter.dateFormat = "yyyy-MM-dd HH"
        case HLDateFormat.TimYearToMinute:
            dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        case HLDateFormat.TimMonthToMonth:
            dateformatter.dateFormat = "MM"
        case HLDateFormat.TimMonthToDay:
            dateformatter.dateFormat = "MM-dd"
        case HLDateFormat.TimMonthToHour:
            dateformatter.dateFormat = "MM-dd HH"
        case HLDateFormat.TimMonthToMinute:
            dateformatter.dateFormat = "MM-dd HH:mm"
        case HLDateFormat.TimDayToDay:
            dateformatter.dateFormat = "dd"
        case HLDateFormat.TimDayToHour:
            dateformatter.dateFormat = "dd HH"
        case HLDateFormat.TimDayToMinute:
            dateformatter.dateFormat = "dd HH:mm"
            
        default:
            dateformatter.dateFormat = String(timeStamp)
        }
        let timeString:String = dateformatter.string(from: date)
        return timeString
    }
}

