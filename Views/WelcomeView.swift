//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by user229431 on 11/16/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
        LocationManager
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            // LocationButton() needs 'CoreLocationUI' imported at top of page
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        // We are doing maxWidth&Height of '.infinity' so that it will take up the entire screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
