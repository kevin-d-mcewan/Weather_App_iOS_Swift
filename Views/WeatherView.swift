//
//  WeatherView.swift
//  WeatherApp
//
//  Created by user229431 on 11/17/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 40))
                                .shadow(color: .red, radius: 10)
                                .colorInvert()
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    // Using AsyncImage grab a free image from web and place it as background
                    AsyncImage(url: URL(string:"https://cdn.pixabay.com/photo/2018/02/23/11/35/company-3175300_1280.jpg")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(logo: "humidity.fill", name: "Humidity: ", value: (weather.main.humidity.roundDouble() + "%"))
                        Spacer()
                        WeatherRow(logo: "wind", name: "Max Temp: ", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Wind Speed: ", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp: ", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.744, saturation: 0.596, brightness: 0.396))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.744, saturation: 0.596, brightness: 0.396))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
