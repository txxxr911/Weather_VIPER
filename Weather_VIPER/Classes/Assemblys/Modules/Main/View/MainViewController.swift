//
//  MainViewController.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit
import SnapKit
import RealmSwift
import Foundation
import CoreLocation
import Network


let realm = try! Realm()


class MainViewController: UIViewController, MainViewInput {
    
    
    func set(weatherData: WeatherData) {
        
    }
    
    var output: MainViewOutput!
    
    var backgroundImage = UIImageView()
    var cityName = UILabel()
    var weatherIcon = UIImageView()
    var temperatureLabel = UILabel()
    var weatherDescription = UILabel()
    var weatherForWeekButton = UIButton()
    
    
    
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        start()

    }
    func start() {
        output.viewDidLoad { weatherData in
            DispatchQueue.main.sync {
                self.cityName.text = weatherData.cityName
                self.weatherIcon.image = UIImage(named: weatherData.weatherIcon)
                self.temperatureLabel.text = "\(weatherData.temperature) ºC"
                self.weatherDescription.text = weatherData.weatherDescription
            }
            
        }
        }
    
    func updateView() {
        
    }
    
    @IBAction func buttonPressed(_sender: UIButton) {
        print("tapped")
        output.buttonPressed()
    }
    
    
    func initialize() {
        backgroundImage.image = UIImage(named: "backgroundImage")
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints{maker in
            maker.top.equalToSuperview().inset(0)
            maker.bottom.equalToSuperview().inset(0)
            maker.left.equalToSuperview().inset(0)
            maker.right.equalToSuperview().inset(0)
        }

        
        cityName.text = "Your city"
        cityName.font = UIFont(name: "Georgia-Bold", size: 25)
        view.addSubview(cityName)
        cityName.snp.makeConstraints{maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(125)
        }
        
        weatherIcon.image = UIImage(named: "weatherIcon")
        view.addSubview(weatherIcon)
        weatherIcon.snp.makeConstraints{maker in
            maker.width.equalTo(50)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(cityName).inset(50)
            
        }
        
        temperatureLabel.text = " ºC"
        temperatureLabel.font = UIFont(name: "Georgia-Bold", size: 25)
        view.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints{maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(weatherIcon).inset(70)
        }
        
        weatherDescription.text = "Weather desription"
        weatherDescription.font = UIFont(name: "Georgia-Bold", size: 20)
        view.addSubview(weatherDescription)
        weatherDescription.snp.makeConstraints{maker in
            maker.top.equalTo(temperatureLabel).inset(50)
            maker.centerX.equalToSuperview()
        }
        
        weatherForWeekButton.setTitle("Weather for week", for: .normal)
        view.addSubview(weatherForWeekButton)
        weatherForWeekButton.backgroundColor = .systemFill
        weatherForWeekButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 15)
        weatherForWeekButton.layer.cornerRadius = 10
        weatherForWeekButton.snp.makeConstraints{maker in
            maker.top.equalTo(weatherDescription).inset(240)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(150)
            maker.height.equalTo(40)
        }
        weatherForWeekButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

// MARK: - Configure
extension MainViewController {
    
}

// MARK: View Input
extension MainViewController {

}

// MARK: Button Action
extension MainViewController {
//    @IBAction func buttonPressed(_sender: Any?) {
//        print("tapped")
//        output.buttonPressed()
//    }
}

