//
//  News.swift
//  NetworkKit
//
//  Created by Burak Donat on 7/9/23.
//

import Foundation

// MARK: - Welcome
public struct News: Decodable {
    public let articles: [Article]
}

// MARK: - Article
public struct Article: Decodable {
    public let source: Source
    public let title: String
    public let description: String?
    public let urlToImage: String?
}

// MARK: - Source
public struct Source: Decodable {
    public let id: String?
    public let name: String
}
