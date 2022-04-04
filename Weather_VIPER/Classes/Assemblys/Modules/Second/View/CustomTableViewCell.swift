//
//  CustomTableViewCell.swift
//  Weather_VIPER
//
//  Created by Victor on 22.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    var dayName = UILabel()
    var weatherIcon = UIImageView()
    var minTemperature = UILabel()
    var maxTemperature = UILabel()
    
    static let identifier = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        dayName.text = "День недели"
        weatherIcon.image = UIImage(named: "04d")
        minTemperature.text = "15º"
        maxTemperature.text = "30º"
        contentView.addSubview(dayName)
        contentView.addSubview(weatherIcon)
        contentView.addSubview(minTemperature)
        contentView.addSubview(maxTemperature)
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dayName.frame = CGRect(x: 15, y: 5, width: 100, height: contentView.frame.size.height-10)
        dayName.font = UIFont(name: "Georgia", size: 15)
        
        minTemperature.frame = CGRect(x: 150, y: 10, width: 40, height: contentView.frame.size.height-10)
        minTemperature.font = UIFont(name: "Georgia", size: 17)
        weatherIcon.frame = CGRect(x: 180, y: 5, width: 40, height: contentView.frame.size.height-10)
        
        maxTemperature.frame = CGRect(x: 230, y: -5, width: 40, height: contentView.frame.size.height-10)
        maxTemperature.font = UIFont(name: "Georgia", size: 17)
    }
    
}
