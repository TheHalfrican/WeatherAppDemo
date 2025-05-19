//
//  WelcomeView.swift
//  WeatherAppDemo
//
//  Created by Owner on 5/15/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome Traveler 🥹")
                    .font(.title)
                    .bold()
                Text("You must be tired from carrying all that junk in your trunk...")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Text("Perhaps you would like to check the Weather? UwU")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)            }
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .tint(.indigo)
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
