//
//  NewsTableViewModel.swift
//  NewsCellKit
//
//  Created by Burak Donat on 7/9/23.
//

import UIKit

public class NewsTableViewCellModel {

    let title: String
    let description: String
    let id: String
    let artworkUrl: String

    public init(title: String, description: String, id: String, artworkUrl: String) {
        self.title = title
        self.description = description
        self.id = id
        self.artworkUrl = artworkUrl
    }
}
