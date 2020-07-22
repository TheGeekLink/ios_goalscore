//
//  CalendarModal.swift
//  GoalScore
//
//  Created by mac_user on 6/28/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import Foundation

protocol CalendarDelgate {
    
}

class CalendarPicker {
    
    var delegate: CalendarDelgate?
    
    func arrayOfDates() -> [String] {
        
        let numberOfDays: Int = 14
        let startDate = Date()
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "EEE-d, M"
        let calendar = Calendar.current
        var offset = DateComponents()
        var dates: [String] = [formatter.string(from: startDate)]
        
        for i in 1..<numberOfDays {
            offset.day = i
            let nextDay: Date? = calendar.date(byAdding: offset, to: startDate)
            let nextDayString = formatter.string(from: nextDay!)
            dates.append(nextDayString)
        }
        return dates
    }
    
}
