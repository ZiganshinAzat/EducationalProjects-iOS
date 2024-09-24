//
//  FlightRowView.swift
//  SwiftUI-SwiftBook-5
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct FlightRowView: View {
//    @State private var detailIsPresented = false

    let flight: FlightInformation

    var body: some View {
//        Button(action: { detailIsPresented = true }) {
            HStack {
                Text("\(flight.airline) \(flight.number)")
                    .frame(width: 120, alignment: .leading)
                Text(flight.otherAirport)
                    .frame(alignment: .leading)
                Spacer()
                Text(flight.flightStatus)
                    .frame(alignment: .trailing)
            }
//            .contentShape(Rectangle()) // Расширяем область кликабельности до всей ячейки
//            .sheet(isPresented: $detailIsPresented, content: {
//                FlightDetailsView(isPresented: $detailIsPresented, flight: flight)
//            })
//        }
//        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    FlightRowView(flight: FlightInformation.generateFlight())
}
