//
//  ViewController.swift
//  SwiftPM
//
//  Created by Азат Зиганшин on 18.02.2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let parameters = ["sortField" : "votes.imdb", "sortType" : "-1", "limit" : "5", "selectFields" : "poster", "premiere.world" : yearRangeString()]

        let headers: HTTPHeaders = [
            "X-API-KEY": "7QNZ39K-0NYMDFY-K57NSVF-WEPGZCW",
            "accept": "application/json"
        ]

        AF.request("https://api.kinopoisk.dev/v1.4/movie", parameters: parameters, headers: headers).response { response in
            debugPrint(response)
        }
        print(123)

//        let headers: HTTPHeaders = [
//                    "X-API-KEY": "7QNZ39K-0NYMDFY-K57NSVF-WEPGZCW",
//                    "accept": "application/json"
//        ]
//
//        AF.request("https://api.kinopoisk.dev/v1.4/movie?limit=5&sortField=votes.kp&sortType=-1&premiere.world=01.03.2024-01.04.2024", headers: headers).response { response in
//            debugPrint(response)
//        }

    }

    func yearRangeString() -> String {
        let currentDate = Date()
        let calendar = Calendar.current

        let today = calendar.startOfDay(for: currentDate)

        guard let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: today) else {
            return ""
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let todayString = dateFormatter.string(from: today)
        let oneMonthAgoString = dateFormatter.string(from: oneYearAgo)

        let yearRange = "\(oneMonthAgoString)-\(todayString)"

        return yearRange
    }

}

