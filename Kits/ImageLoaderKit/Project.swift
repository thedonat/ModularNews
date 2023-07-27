//
//  ImageLoaderKit.swift
//  Manifests
//
//  Created by Burak Donat on 7/10/23.
//

import Foundation

import ProjectDescription
import ProjectDescriptionHelpers

private func makeDependencies() -> [TargetDependency] {
    let dependencies: [TargetDependency] = [
        .external(name: ExternalSwiftPackageManager.sDWebImage.description)
    ]
    return dependencies
}

let project = Project.makeTarget(
    name: "ImageLoaderKit",
    hasResources: false,
    dependencies: makeDependencies()
)
