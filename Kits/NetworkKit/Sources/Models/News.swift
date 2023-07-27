//
//  News.swift
//  NetworkKit
//
//  Created by Burak Donat on 7/9/23.
//

import Foundation

// MARK: - Welcome
public struct NewsResponse: Codable {
    public let feed: News
}

// MARK: - Feed
public struct News: Codable {
    public let results: [Article]
}

// MARK: - Result
public struct Article: Codable {
    public let artistName, name, id: String
    public let artworkUrl100: String
    public let genres: [Genre]
    public let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, name, id
        case artworkUrl100, genres, url
    }
}

// MARK: - Genre
public struct Genre: Codable {
    public let genreID, name: String
    public let url: String

    public enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}
