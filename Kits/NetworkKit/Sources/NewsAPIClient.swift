//
//  NewsAPIClient.swift
//  NetworkKit
//
//  Created by Burak Donat on 7/7/23.
//

import Foundation
import Moya

public protocol NewsAPINetworkable {
    func getNews(completion: @escaping (Result<NewsResponse, Error>) -> Void)
}

public final class NewsAPIClient: NewsAPINetworkable {

    private var provider: MoyaProvider<NewsAPIEndpoint> = MoyaProvider<NewsAPIEndpoint>(plugins: [NetworkLoggerPlugin.verbose])

    public init() {}

    public func getNews(completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        request(target: .getNews, completion: completion)
    }
}

extension NewsAPIClient {
    private func request<T: Decodable>(target: NewsAPIEndpoint, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):

                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
