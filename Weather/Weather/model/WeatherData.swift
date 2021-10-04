//
//  WeatherData.swift
//  Weather
//
//  Created by Jiyoung Park on 2021/10/04.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
}
