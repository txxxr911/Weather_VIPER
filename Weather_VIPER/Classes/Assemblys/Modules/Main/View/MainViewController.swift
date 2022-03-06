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

struct Local_Names: Codable{
    var ru: String = ""
    
}

struct CorrectCity: Codable{
    var name: String = ""
    var local_names: Local_Names = Local_Names()
}


struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
struct Main: Codable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
    
}
struct WeatherData: Codable{
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}


class SavedWeatherData: Object {
    @objc dynamic var cityName: String? = ""
    @objc dynamic var iconName: String? = ""
    @objc dynamic var temperature: String? = ""
    @objc dynamic var weatherDescription: String? = ""
}

let realm = try! Realm()


class MainViewController: UIViewController, MainViewInput {
    var output: MainViewOutput!
    
    var backgroundImage = UIImageView()
    var cityName = UILabel()
    var weatherIcon = UIImageView()
    var temperatureLabel = UILabel()
    var weatherDescription = UILabel()
    
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    var correctCity = CorrectCity()
    var rightData: [CorrectCity] = []
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let monitor = NWPathMonitor()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewDidLoad()
        initialize()
        start()
    }
        func start() {
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
                    monitor.pathUpdateHandler = {path in
                        DispatchQueue.main.async {
            if path.status == .satisfied{
                self.startLocationManager()
                }
                       else{
                           self.getData()
                       }
                        }
                    }
        }
    func getData(){
        let dataSet = realm.objects(SavedWeatherData.self)
        for data in dataSet {
            cityName.text = data.cityName
            weatherIcon.image = UIImage(named: data.iconName!)
            temperatureLabel.text = data.temperature
            weatherDescription.text = data.weatherDescription
        }
    }
    
    func setData(){
        let data = SavedWeatherData()
        
        
        try! realm.write{
            data.cityName = cityName.text
            data.iconName = weatherData.weather[0].icon
            data.temperature = temperatureLabel.text
            data.weatherDescription = weatherDescription.text
            realm.add(data)
        }
        
        //try! realm.commitWrite()
        
    }
    
    
    func startLocationManager(){
        locationManager.requestWhenInUseAuthorization()
        print("requested")
        if CLLocationManager.locationServicesEnabled(){
            print("enabled")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.pausesLocationUpdatesAutomatically = true
            locationManager.startUpdatingLocation()
            
        }
    }

    func getWeatherInfo(latitude: Double, longtitude: Double){
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&appid=7ecd06499c4370fe484ef26aff81cc5c&units=metric&lang=ru")!
        let request = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Data task error: \(error!.localizedDescription)")
            return
        }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    self.correctCity(latitude: latitude, longtitude: longtitude)
                    self.updateView()
                }
            } catch  {
                print(error)
            }
        }
        request.resume()
    }
    func updateView(){
        weatherDescription.text = DataSource.weatherIDs[weatherData.weather[0].id]
        temperatureLabel.text = Int(round(weatherData.main.temp)).description + "º"
        weatherIcon.image = UIImage(named: weatherData.weather[0].icon)
        
}
    func rightCity(){
        cityName.text = rightData[0].local_names.ru
        setData()
    }
    func correctCity(latitude: Double, longtitude: Double){
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/geo/1.0/reverse?lat=\(latitude)&lon=\(longtitude)&limit=10&appid=7ecd06499c4370fe484ef26aff81cc5c")!
        let request = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Data task error: \(error!.localizedDescription)")
            return
        }
            do {
                self.rightData = try JSONDecoder().decode([CorrectCity].self, from: data!)
                DispatchQueue.main.async {
                    self.rightCity()
                }
            } catch  {
                print(error)
            }
        }
        request.resume()
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
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension MainViewController {
    
}



extension MainViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let curentLocation = locations.last {
            print (curentLocation.coordinate.latitude, curentLocation.coordinate.longitude)
            getWeatherInfo(latitude: curentLocation.coordinate.latitude, longtitude: curentLocation.coordinate.longitude)
            //setData()
        }
        
        
    }
    
}
