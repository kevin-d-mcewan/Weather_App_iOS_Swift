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
    
    var body: some View {
        VStack {
            WelcomeView()
                .environmentObject(locationManager)
        }
        .background(Color(hue: 0.744, saturation: 0.692, brightness: 0.888))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
