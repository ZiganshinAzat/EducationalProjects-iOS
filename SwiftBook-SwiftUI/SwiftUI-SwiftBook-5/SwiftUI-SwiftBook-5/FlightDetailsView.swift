//
//  FlightDetailsView.swift
//  SwiftUI-SwiftBook-5
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct FlightDetailsView: View {
//    @Binding var isPresented: Bool
    let flight: FlightInformation

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) \(flight.number)")
                    .font(.largeTitle)
                Spacer()
                Button("Done") {
//                    isPresented = false
                }
            }
            Text("\(flight.direction == .arrival ? "From: " : "To: ") \(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundStyle(Color(flight.timelineColor))
            Spacer()
        }
        .font(.headline)
        .padding()
        .navigationTitle("Flight Information")
    }
}

#Preview {
//    FlightDetailsView(isPresented: .constant(true), flight: FlightInformation.generateFlight())
    FlightDetailsView(flight: FlightInformation.generateFlight())
}
