//
//  Dependencies.swift
//  Manifests
//
//  Created by Burak Donat on 7/7/23.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/Moya/Moya",
            requirement: .upToNextMajor(from: "15.0.3")
        ),
        .remote(
            url: "https://github.com/SDWebImage/SDWebImage.git",
            requirement: .upToNextMajor(
                from: "5.16.0"
            )
        )
    ],
    platforms: Set(arrayLiteral: .iOS))

