//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Akeem Mohammed on 11/18/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            // this vstack contains the name of the location plus the date and time
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(.title)

                    
                    Text("Today: \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // this vstack contains the weather icon
                VStack {
                    
                    // this field will contain the temperature and stuff
                    HStack {
                        VStack(spacing: 20){
                            Image(systemName: "sun.max").font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°").font(.system(size:100)).fontWeight(.bold).padding()
                        
                    }
                    
                    Spacer().frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                        image in image
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Weather Info")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.temp_min.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.15, saturation: 0.94, brightness: 0.041))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.15, saturation: 0.421, brightness: 0.847))
        .preferredColorScheme(.light)

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
