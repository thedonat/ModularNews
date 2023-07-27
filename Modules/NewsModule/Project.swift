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
        AllDependencies.Kits.dependencyManagerKit,
        AllDependencies.Kits.commonKit,
        AllDependencies.Kits.networkKit,
        AllDependencies.Kits.newsFavKit,
        AllDependencies.Kits.imageLoaderKit,
        AllDependencies.ModuleInterfaces.newsModuleInterfaceTargetDependency,
        AllDependencies.ModuleInterfaces.newsDetailModuleInterfaceTargetDependency
    ])
    return dependencies
}
private func makeTargets() -> [Target] {
    var targets: [Target] = []
    targets.append(contentsOf: [
        AllDependencies.ModuleInterfaces.newsModuleInterfaceTarget
    ])
    return targets
}

let project = Project.makeTarget(
    name: "NewsModule",
    hasResources: true,
    dependencies: makeDependencies(),
    hasUnitTest: false,
    targets: makeTargets()
)
