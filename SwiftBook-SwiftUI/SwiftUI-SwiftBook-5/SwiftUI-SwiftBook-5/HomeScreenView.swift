//
//  ContentView.swift
//  SwiftUI-SwiftBook-5
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

enum Route: Hashable {
    case arrivals
    case departures
}

struct HomeScreenView: View {
    private let flightInfo = FlightInformation.generateFlights()

    private var arrivals: [FlightInformation] {
        flightInfo.filter {
            $0.direction == .arrival
        }
    }

    private var departures: [FlightInformation] {
        flightInfo.filter {
            $0.direction == .departure
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .opacity(0.4)
                    .rotationEffect(.degrees(-90))

                //                VStack(alignment: .leading, spacing: 8) {
                //                    NavigationLink("Arrivals") {
                //                        FlightBoardView(
                //                            boardName: "Arrivals",
                //                            flightInfo: arrivals
                //                        )
                //                    }
                //                    NavigationLink("Departures") {
                //                        FlightBoardView(
                //                            boardName: "Departures",
                //                            flightInfo: departures
                //                        )
                //                    }
                //                    Spacer()
                //                }
                VStack(alignment: .leading, spacing: 8) {
                    NavigationLink("Arrivals", value: Route.arrivals)
                    NavigationLink("Departures", value: Route.departures)

                    Spacer()
                }
                .font(.title)
                .padding()
            }
            .navigationTitle("Airport")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .arrivals:
                    FlightBoardView(
                        boardName: "Arrivals",
                        flightInfo: arrivals
                    )
                case .departures:
                    FlightBoardView(
                        boardName: "Departures",
                        flightInfo: departures
                    )
                }
            }
        }

    }
}

#Preview {
    HomeScreenView()
}
