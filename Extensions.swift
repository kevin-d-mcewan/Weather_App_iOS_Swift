//
//  Extensions.swift
//  WeatherApp
//
//  Created by user229431 on 11/17/22.
//

import Foundation

// this extension will be used to round all the Doubles in the project to no more than 2 decimals
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
