//
//  WeatherModel.swift
//  DemoWeatherData
//
//  Created by softqube on 05/11/19.
//  Copyright © 2019 softqube. All rights reserved.
//

import Foundation

struct weatherData : Codable {
    let cod : String?
    let message : Double?
    let cnt : Int?
    let list : [List]?
    
    enum CodingKeys: String, CodingKey {
        
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
    }
}

struct List : Codable {
    let dt : Int?
    let dt_txt : String?
    
    enum CodingKeys: String, CodingKey {
        
        case dt = "dt"
        case dt_txt = "dt_txt"
    }
}
