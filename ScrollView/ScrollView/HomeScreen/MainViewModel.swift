//
//  HomeViewModel.swift
//  ScrollView
//
//  Created by Азат Зиганшин on 01.04.2024.
//

import Foundation
import Kingfisher
import Combine

class MainViewModel {

    private let filmsAPIManager: FilmsAPIManager

//    private var getPopularFilmsResult: [URL?]? {
//        didSet {
//            guard let result = getPopularFilmsResult else { return }
//            getPopularFilmsResultBlock?(result)
//        }
//    }
//
//    private var getReviewsResult: [Review]? {
//        didSet {
//            guard let result = getReviewsResult else { return }
//            getReviewsResultBlock?(result)
//        }
//    }

    @Published var popularFilmsImages: [URL?] = []
    @Published var recentReviews: [Review] = []

    var getPopularFilmsResultBlock: (([URL?]) -> Void)?
    var getReviewsResultBlock: (([Review]) -> Void)?

    init(filmsAPIManager: FilmsAPIManager) {
        self.filmsAPIManager = filmsAPIManager
    }

    func getPopularFilmsImages() {
        filmsAPIManager.getFivePopularFilmsImages { [weak self] images in
            // self?.getPopularFilmsResult = images
            self?.popularFilmsImages = images
        }
    }

    func getReviews() {
        filmsAPIManager.getReviews { [weak self] reviews in
            // self?.getReviewsResult = reviews
            self?.recentReviews = reviews
        }
    }
}
