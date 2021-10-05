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
    }
    
    private func fetchWeather() {
        weatherManager.fetchWeather(byCity: "seoul") { [weak self] (result) in
            guard let this = self else {return}
            switch result {
            case .success(let model):
                this.updateView(with: model)
            case .failure(let error):
                print("error here: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateView(with model: WeatherModel){
        hideAnimation()
        temperatureLabel.text = model.temp.toString().appending("°C")
        conditionLabel.text = model.conditionDescription
        navigationItem.title = model.countryName
        conditionImageView.image = UIImage(named: model.conditionImage)
        
    }
    
    private func hideAnimation() {
        conditionImageView.hideSkeleton()
        temperatureLabel.hideSkeleton()
        conditionLabel.hideSkeleton()
    }
    
    private func showAnimation() { //Skeleton 효과 줄 수 있음: 은색 반짝반짝
        conditionImageView.showAnimatedSkeleton()
        temperatureLabel.showAnimatedSkeleton()
        conditionLabel.showAnimatedSkeleton()
    }

    @IBAction func addCityButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showAddCity", sender: nil)
    }
    
    @IBAction func locaionButtonTapped(_ sender: Any) {
    }
}

