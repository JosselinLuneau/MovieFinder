//
//  DateExtension.swift
//  MoviesFinder
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func getFormattedDateFromString(stringDate: String, dateFormat: String = "yyyy-MM-dd") -> Date {
        let format = DateFormatter()
        format.dateFormat = dateFormat
        
        guard let date = format.date(from: stringDate) else {
            return Date()
        }
    
        return date
    }
}
