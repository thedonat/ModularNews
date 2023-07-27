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
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/") else {
            fatalError("What are you doing bro?")
        }
        return url
    }

    var path: String {
        switch self {
        case .getNews:
            return "us/music/most-played/25/albums.json"
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
            return .requestPlain
        }
    }

    var headers: HTTPHeader? {
        nil
    }
}



