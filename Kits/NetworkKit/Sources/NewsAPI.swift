//
//  NewsAPI.swift
//  NetworkKit
//
//  Created by Burak Donat on 7/7/23.
//

import Foundation
import Moya

enum NewsAPIEndpoint {
    case getNews
}

extension NewsAPIEndpoint: TargetType {
    typealias HTTPHeader = [String: String]
    typealias Parameters = [String: Any]

    var baseURL: URL {
        guard let url = URL(string: "https://newsapi.org/v2/") else {
            fatalError("What are you doing bro?")
        }
        return url
    }

    var path: String {
        switch self {
        case .getNews:
            return "top-headlines"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getNews:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getNews:
            // Your API_KEY needs to be added
            let params = ["country": "us", "apiKey": "fa68fee749e04314a452180019ed7fae"]
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.queryString)
        }
    }

    var headers: HTTPHeader? {
        switch self {
        case .getNews:
            return ["Content-Type" : "application/json"]
        }
    }
}



