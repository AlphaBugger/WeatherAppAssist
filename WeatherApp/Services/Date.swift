//
//  FormatDate.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 28.11.2023.
//

import Foundation

enum DateError: Error{
    case invalidFormat
}

func formateDate(dateString: String)->Result<(day:Int, hour:Int), DateError>{
    
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
    if let date = dateFormater.date(from: dateString){
        let calendar = Calendar.current
        let dayComponent = calendar.component(.day, from: date)
        let hourComponent = calendar.component(.hour, from: date)
        return .success((day:dayComponent, hour:hourComponent))
    }else{
        return .failure(.invalidFormat)
    }
    
}

