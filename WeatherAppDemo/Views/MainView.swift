//
//  ContentView.swift
//  WeatherAppDemo
//
//  Created by Owner on 5/15/25.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting Weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
                    
            }

        }
        .background(Color(hue: 0.726, saturation: 0.856, brightness: 0.86))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView()
}
