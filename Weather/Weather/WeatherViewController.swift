//
//  ViewController.swift
//  Weather
//
//  Created by Jiyoung Park on 2021/10/04.
//

import UIKit
import SkeletonView

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    private let weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
        fetchWeather()
        //weatherManager.fetchWeather(byCity: "seoul")
    }
    
    private func fetchWeather() {
        weatherManager.fetchWeather(byCity: "new york") { [weak self] (result) in
            guard let this = self else {return}
            switch result {
            case .success(let weatherData):
                this.updateView(with: weatherData)
            case .failure(let error):
                print("error here: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateView(with data: WeatherData){
        
        hideAnimation()
        temperatureLabel.text = data.main.temp.toString().appending("°C")
        conditionLabel.text = data.weather.first?.description
        navigationItem.title = data.name
    }
    
    private func hideAnimation() {
        conditionImageView.hideSkeleton()
        temperatureLabel.hideSkeleton()
        conditionLabel.hideSkeleton()
    }
    
    private func showAnimation() { //Skeleton 효과 줄 수 있음
        conditionImageView.showAnimatedSkeleton()
        temperatureLabel.showAnimatedSkeleton()
        conditionLabel.showAnimatedSkeleton()
    }

    @IBAction func addLocationButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func locaionButtonTapped(_ sender: Any) {
    }
}

