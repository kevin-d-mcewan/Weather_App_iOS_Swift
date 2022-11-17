//
//  ContentView.swift
//  WeatherApp
//
//  Created by user229431 on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    // Initializing our LocationManager class
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            // An if statement to show cordinates of user but if statement bc sharing coordinates is optional
            if let location = locationManager.location {
                // print out long and lat cord
                if let weather = weather {
                    WeatherView(weather: weather)                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude:location.latitude,                    longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } // If coords are given we will show a progress bar but if no coords then we will just show the regular 'Welcome Screen'
                else {
                if locationManager.isLoading {
                    // Load 'ProgressView' from LoadingView Script
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.744, saturation: 0.596, brightness: 0.396))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
