//
//  FlightBoardView.swift
//  SwiftUI-SwiftBook-5
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct FlightBoardView: View {
    let boardName: String
    let flightInfo: [FlightInformation]

    var body: some View {  
        //            ScrollView {
        //                ForEach(flightInfo, id: \.self) { flight in
        //                    Text("\(flight.airline) \(flight.number)")
        //                }
        //            }

        List(flightInfo) { flight in
            NavigationLink(destination: FlightDetailsView(flight: flight)) {
                FlightRowView(flight: flight)
            }
        }
//        .listStyle(.plain)
        .navigationTitle(boardName)
    }
}

#Preview {
    FlightBoardView(
        boardName: "Arrivals",
        flightInfo: FlightInformation.generateFlights()
    )
}
