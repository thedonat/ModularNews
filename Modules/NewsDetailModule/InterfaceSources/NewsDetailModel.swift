//
//  NewsDetailModel.swift
//  NewsDetailModuleInterface
//
//  Created by Burak Donat on 7/10/23.
//

import Foundation

public struct NewsDetailModel {

    public let title: String
    public let description: String

    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
