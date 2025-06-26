//
//  ViewController.swift
//  Weather
//
//  Created by Дания Куспанова on 26.06.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var weather: UILabel!
    @IBOutlet var buttonGetWeather: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonGetWeather.addTarget(self, action: #selector(didTabGetWeatherButton), for: .touchUpInside)
    }
    @objc func didTabGetWeatherButton(){
        let urlStringWeather = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
        let url = URL(string: urlStringWeather)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data, let weather = try? JSONDecoder().decode(WeatherData.self, from:data){
                DispatchQueue.main.async {
                    self.weather.text = "\(weather.current.temperature2M) °C"
                }
            }
            else{
                print("Failed/////")
            }
        }
        task.resume()
    }

}

