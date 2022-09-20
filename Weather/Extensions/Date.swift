//
//  Date.swift
//  Weather
//
//  Created by admin on 8.09.22.
//


import UIKit



let todayDay = Date()

let dateFormatter = DateFormatter()

let dateString = dateFormatter.string(from: todayDay)


    
extension Date {
    var toJustTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }

    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EE dd MMMM yyyy")
        return dateFormatter.string(from: self)
    }
    
    var toRusString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("EE, dd MMMM H mm")
        return dateFormatter.string(from: self)
    }
}

