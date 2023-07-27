//
//  Project.swift
//  Manifests
//
//  Created by Burak Donat on 7/7/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

private func makeDependencies() -> [TargetDependency] {
    let dependencies: [TargetDependency] = []
    return dependencies
}
let project = Project.makeTarget(
    name: "NewsFavKit",
    hasResources: false,
    dependencies: makeDependencies()
)
