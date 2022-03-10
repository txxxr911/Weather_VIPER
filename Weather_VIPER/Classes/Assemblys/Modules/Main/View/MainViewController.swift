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

//struct Local_Names: Codable{
//    var ru: String = ""
//    
//}
//
//struct CorrectCity: Codable{
//    var name: String = ""
//    var local_names: Local_Names = Local_Names()
//}


//struct Weather: Codable {
//    var id: Int
//    var main: String
//    var description: String
//    var icon: String
//}
//struct Main: Codable {
//    var temp: Double = 0.0
//    var pressure: Int = 0
//    var humidity: Int = 0
//    
//}
//struct WeatherData: Codable{
//    var weather: [Weather] = []
//    var main: Main = Main()
//    var name: String = ""
//}


//class SavedWeatherData: Object {
//    @objc dynamic var cityName: String? = ""
//    @objc dynamic var iconName: String? = ""
//    @objc dynamic var temperature: String? = ""
//    @objc dynamic var weatherDescription: String? = ""
//}

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
    

    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewDidLoad()
        initialize()
        start()

    }
    func start() {
        print("View send request")
        output.viewDidLoad { weatherData in
            self.cityName.text = weatherData.cityName
            self.weatherIcon.image = UIImage(named: weatherData.weatherIcon)
            self.temperatureLabel.text = weatherData.temperature
            self.weatherDescription.text = weatherData.weatherDescription
        }
        }
    
    func updateView() {
        
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
    }
}

// MARK: - Configure
extension MainViewController {
    
}

// MARK: View Input
extension MainViewController {
//    func set(weatherData: WeatherData) {
//        weatherDescription.text = DataSource.weatherIDs[weatherData.weather[0].id]
//        temperatureLabel.text = Int(round(weatherData.main.temp)).description + "º"
//        weatherIcon.image = UIImage(named: weatherData.weather[0].icon)
////        self.title = title
//    }
}

// MARK: Button Action
extension MainViewController {
    
}



//extension MainViewController: CLLocationManagerDelegate{
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let curentLocation = locations.last {
//            print (curentLocation.coordinate.latitude, curentLocation.coordinate.longitude)
//            getWeatherInfo(latitude: curentLocation.coordinate.latitude, longtitude: curentLocation.coordinate.longitude)
//            //setData()
//        }
//
//
//    }
//
//}
