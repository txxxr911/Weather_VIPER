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
    var weatherTable = UITableView()
    var didGetData: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableView{
            self.output.viewDidLoad {
                self.initialize()
            }
        }
        }
    func updateTableView (didGetData: @escaping () -> Void) {
        self.didGetData = didGetData
        didGetData()
    }
    
    func initialize() {
        
        DispatchQueue.main.sync {
            
        backgroundImage.image = UIImage(named: "backgroundImage")
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints{maker in
            maker.top.equalToSuperview().inset(0)
            maker.bottom.equalToSuperview().inset(0)
            maker.left.equalToSuperview().inset(0)
            maker.right.equalToSuperview().inset(0)
        }
        
        
        
        view.addSubview(weatherTable)
        weatherTable.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().inset(180)
            maker.bottom.equalToSuperview().inset(180)
            maker.left.equalToSuperview().inset(50)
            maker.right.equalToSuperview().inset(50)
        }
        weatherTable.isScrollEnabled = false
        
        weatherTable.register(CustomTableViewCell.self,
                              forCellReuseIdentifier: CustomTableViewCell.identifier)
        weatherTable.delegate = self
        weatherTable.dataSource = self
        weatherTable.backgroundColor = UIColor.clear
    }
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
        cell.minTemperature.text = output.weekWeatherData?.weekWeatherData[indexPath.row].minTemperature.description
        cell.maxTemperature.text = output.weekWeatherData?.weekWeatherData[indexPath.row].maxTemperature.description
        cell.weatherIcon.image = UIImage(named: (output.weekWeatherData?.weekWeatherData[indexPath.row].iconName)!)
        cell.dayName.text = output.weekWeatherData?.weekWeatherData[indexPath.row].dayOfWeek
        return cell
        }
    }
    

// MARK: View Input
extension SecondViewController {
}

// MARK: Button Action
extension SecondViewController {
    
}
