import Foundation

// Structs for week weather

struct WeatherDataForWeek: Codable {
    var weatherForWeek: [Daily] = []
}

struct Daily: Codable {
    var temp: Temp
    var weather: WeatherWeek
    
}

struct Temp: Codable {
    var max: Double
    var min: Double
}

struct WeatherWeek: Codable {
    var icon: String
}
