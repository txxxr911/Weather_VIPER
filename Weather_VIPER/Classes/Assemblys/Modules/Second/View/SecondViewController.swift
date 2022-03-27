//
//  SecondViewController.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import UIKit


class SecondViewController: UIViewController, SecondViewInput, UITableViewDataSource {

    
    var output: SecondViewOutput!
    
    let idCell = "maiCell"
    
    var backgroundImage = UIImageView()
    var cityName = UILabel()
    var weatherTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTable.register(CustomTableViewCell.self,
                              forCellReuseIdentifier: CustomTableViewCell.identifier)
        weatherTable.delegate = self
        weatherTable.dataSource = self
        weatherTable.backgroundColor = UIColor.clear
        initialize()
        output.viewDidLoad { data in
        }
            
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
        cityName.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(125)
            maker.centerX.equalToSuperview()
            
        }
        
        
        
        view.addSubview(weatherTable)
        weatherTable.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().inset(180)
            maker.bottom.equalToSuperview().inset(180)
            maker.left.equalToSuperview().inset(50)
            maker.right.equalToSuperview().inset(50)
        }
        weatherTable.isScrollEnabled = false
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
}

// MARK: - Configure
extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = weatherTable.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
//        output.viewDidLoad { data in
//            print("and here")
//            cell.dayName.text = data.weekWeatherData[indexPath.row].dayOfWeek
//            cell.minTemperature.text = String(data.weekWeatherData[indexPath.row].minTemperature)
//            cell.maxTemperature.text = String(data.weekWeatherData[indexPath.row].maxTemperature)
//            cell.weatherIcon.image = UIImage(named: "\(data.weekWeatherData[indexPath.row].iconName)")
//        }
        
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        weatherTable.deselectRow(at: indexPath, animated: false)
//    }
    
}

// MARK: View Input
extension SecondViewController {
//    func set(title: String) {
//        //self.title = title
//    }
    
//    func showWeekWeather() {
//        view.addSubview(weatherTable)
//    }
}

// MARK: Button Action
extension SecondViewController {
    
}
