//
//  LocationViewController.swift
//  Weather
//
//  Created by admin on 8.09.22.
//

import UIKit
import CoreLocation


class LocationViewController: UIViewController {
    
    
    @IBOutlet var cLabel: UILabel!
   
    @IBOutlet var humidityLabel0: UILabel!
    @IBOutlet var windSpeed: UILabel!
    @IBOutlet var feelsLikeLabel0: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var currentWeatherImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var cityWeather: ForecastWeather!
   
    
    //var weatherData = WeatherData()
    //var onCompletion: ((ForecastWeather) -> Void)?
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addLocationGradient()
        updateLabels()
        startlocationManager()
    }
    
    func updateLabels(){
        currentWeatherImageView.addShadow()
        cityNameLabel.addShadow()
        dateLabel.text = todayDay.toRusString
        dateLabel.addShadow()
        feelsLikeLabel.addShadow()
        humidityLabel.addShadow()
        windLabel.addShadow()
        temperatureLabel.addShadow()
        windLabel.addShadow()
        cLabel.addShadow()
        feelsLikeLabel0.addShadow()
        windSpeed.addShadow()
        humidityLabel0.addShadow()
    }


func startlocationManager() {
    locationManager.requestWhenInUseAuthorization()
   
    if CLLocationManager.locationServicesEnabled() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
    }
}

func updateView() {
    cityNameLabel.text = weatherData.name
    temperatureLabel.text = weatherData.main.temp.description
    humidityLabel.text = weatherData.main.humidity.description + " %"
    
}

func updateWeatherInfo(latitude: Double, longtitude: Double){
    
    
    let session = URLSession.shared
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&lang=ru&appid=d3bade5172c920c5bca756844261b789&units=metric")!
    let task = session.dataTask(with: url) { data, response, error in
        guard error == nil else {
            print("DataTask error: \(error!.localizedDescription)")
            return
        }
        do{
            self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
            DispatchQueue.main.async {
                self.updateView()
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    task.resume()
    
}
}

extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
            

        }
    }
}

