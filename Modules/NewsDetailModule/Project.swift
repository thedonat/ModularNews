//
//  Project.swift
//  Manifests
//
//  Created by Burak Donat on 7/3/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

private func makeDependencies() -> [TargetDependency] {
    var dependencies: [TargetDependency] = []
    dependencies.append(contentsOf: [
        AllDependencies.ModuleInterfaces.newsDetailModuleInterfaceTargetDependency,
        AllDependencies.Kits.networkKit,
        AllDependencies.Kits.commonKit,
        AllDependencies.Kits.dependencyManagerKit,
        AllDependencies.Kits.imageLoaderKit
    ])
    return dependencies
}
private func makeTargets() -> [Target] {
    var targets: [Target] = []
    targets.append(contentsOf: [
        AllDependencies.ModuleInterfaces.newsDetailModuleInterfaceTarget
    ])
    return targets
}

let project = Project.makeTarget(
    name: "NewsDetailModule",
    hasResources: true,
    dependencies: makeDependencies(),
    hasUnitTest: false,
    targets: makeTargets()
)
