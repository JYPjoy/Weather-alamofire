//
//  WeatherManager.swift
//  Weather
//
//  Created by Jiyoung Park on 2021/10/04.
//

import Foundation
import Alamofire

struct WeatherManager {
    
    private let API_KEY = "e7379996276b09c2b07ceb4e5cd01e57"
    
    func fetchWeather(byCity city: String, completion: @escaping(Result<WeatherModel, Error>) -> Void) {
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let path = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
        let urlString = String(format: path, query, API_KEY)
        
        AF.request(urlString).responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) {(response) in
            switch response.result {
            case .success(let weatherData):
                let model = weatherData.model
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
