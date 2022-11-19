//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Akeem Mohammed on 11/17/22.
//

import SwiftUI
import CoreLocationUI //for the button framework

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager:
        LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather Oracle!").bold().font(.title)
                
//                Text("Please share current Location").font(.headline).padding(<#T##insets: EdgeInsets##EdgeInsets#>)
            }
            .multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation) {
                //this is used to design the function of a button
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
