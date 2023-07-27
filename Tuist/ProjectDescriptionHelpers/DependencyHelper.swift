//
//  DependencyHelper.swift
//  ProjectDescriptionHelpers
//
//  Created by Burak Donat on 7/6/23.
//

import Foundation
import ProjectDescription

// MARK: - Path Constants
public enum PathConstants {
    public static let modulesPath: String = "Modules/"
    public static let kitsPath: String = "Kits/"
    public static let xcFrameWorksPath: String = "XCFrameworks/"
    public static let interfacesPath: String = "ModuleInterfaces/"
    public static let configPath: String = "config/"
}

// MARK: - Module Paths
private enum ModulePaths: String {
    case newsModule
    case newsDetailModule

    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
    func createModuleTargetDependency() -> TargetDependency {
        .project(target: self.description, path: .relativeToRoot(PathConstants.modulesPath.appending(self.description)))
    }
}

// MARK: - Kit Paths
private enum KitPaths: String {
    case dependencyManagerKit
    case commonKit
    case networkKit
    case newsFavKit
    case imageLoaderKit

    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
    func makeTargetDependency() -> TargetDependency {
        .project(target: self.description, path: .relativeToRoot(PathConstants.kitsPath.appending(self.description)))
    }
}

// MARK: - Interface Paths
public enum InterfacePaths: String {
    case newsModuleInterface
    case newsDetailModuleInterface

    public var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
    func makeTarget() -> Target {
        .init(
            name: self.description,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "burakdonat.\(self.description)",
            infoPlist: .default,
            sources: ["InterfaceSources/**"]
        )
    }
    func createInterfaceTargetDependency() -> TargetDependency {
        .project(target: self.description, path: .relativeToRoot(PathConstants.modulesPath.appending(self.description).replacingOccurrences(of: "Interface", with: "")))
    }
}

// MARK: - Third Parties
public enum ExternalSwiftPackageManager: String {
    case moya
    case sDWebImage
    case xCMetrics

    public var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
    // wrap .external as targetdepenceny return type..
}

// MARK: - XCFrameworkPaths
private enum XCFrameworkPaths: String {
    case moya

    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
}

// MARK: - All Dependencies
public enum AllDependencies {

    // MARK: - Modules
    public enum Modules {
        public static let newsModule: TargetDependency = ModulePaths.newsModule.createModuleTargetDependency()
        public static let newsDetailModule: TargetDependency = ModulePaths.newsDetailModule.createModuleTargetDependency()
    }

    // MARK: - Kits
    public enum Kits {
        public static let dependencyManagerKit: TargetDependency = KitPaths.dependencyManagerKit.makeTargetDependency()
        public static let commonKit: TargetDependency = KitPaths.commonKit.makeTargetDependency()
        public static let networkKit: TargetDependency = KitPaths.networkKit.makeTargetDependency()
        public static let newsFavKit: TargetDependency = KitPaths.newsFavKit.makeTargetDependency()
        public static let imageLoaderKit: TargetDependency = KitPaths.imageLoaderKit.makeTargetDependency()
    }

    // MARK: - Module Interfaces
    public enum ModuleInterfaces {
        public static let newsModuleInterfaceTarget: Target = InterfacePaths.newsModuleInterface.makeTarget()
        public static let newsModuleInterfaceTargetDependency: TargetDependency = InterfacePaths.newsModuleInterface.createInterfaceTargetDependency()
        public static let newsDetailModuleInterfaceTarget: Target = InterfacePaths.newsDetailModuleInterface.makeTarget()
        public static let newsDetailModuleInterfaceTargetDependency: TargetDependency = InterfacePaths.newsDetailModuleInterface.createInterfaceTargetDependency()
    }

    // MARK: - XCFrameworks
    public enum XCFrameworks {
        public static let moya: TargetDependency =
            .xcframework(path: .relativeToRoot(PathConstants.xcFrameWorksPath.appending("/Moya.xcframework")))
    }


}
