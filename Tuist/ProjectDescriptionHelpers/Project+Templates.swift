import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    public static func makeTarget(
        name: String,
        hasResources: Bool = false,
        dependencies: [TargetDependency],
        hasUnitTest: Bool = false,
        hasUITest: Bool = false,
        targets: [Target] = [],
        unitTestsDependencies: [TargetDependency] = []
    ) -> Self {
        var allTargets: [Target] = []
        var unitTestDependencies: [TargetDependency] = []
        unitTestDependencies.append(contentsOf: [
            .target(name: name)
        ])
        unitTestDependencies.append(contentsOf: unitTestsDependencies)
        allTargets.append(contentsOf: targets)
        let sources = Target(
            name: name,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "burakdonat.\(name)",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: hasResources ? "Resources/**" : nil,
            dependencies: dependencies
        )
        allTargets.append(contentsOf: [sources])
        if hasUnitTest {
            let unitTestTarget = Target(
                name: name.appending("Tests"),
                platform: .iOS,
                product: .unitTests,
                bundleId: "burakdonat.\(name)".appending("Tests"),
                infoPlist: .default,
                sources: "Tests/**",
                dependencies: unitTestDependencies,
                settings: nil
            )
            allTargets.append(contentsOf: [unitTestTarget])
        }
        if hasUITest {
            let uiTestTarget = Target(
                name: name.appending("UITests"),
                platform: .iOS,
                product: .uiTests,
                bundleId: "burakdonat.\(name)".appending("UITests"),
                infoPlist: .default,
                sources: "UITests/**",
                dependencies: [
                    .target(name: name)
                ])
            allTargets.append(contentsOf: [uiTestTarget])
        }
        // TODO: - Even coverage is done for each project, workspace does not include these options.. update it for getting coverage via smth like "slather".. later on
        return .init(
            name: name,
            options: .options(automaticSchemesOptions: .enabled(targetSchemesGrouping: .singleScheme, codeCoverageEnabled: true, testingOptions: .parallelizable), developmentRegion: nil, disableBundleAccessors: false, disableShowEnvironmentVarsInScriptPhases: false, disableSynthesizedResourceAccessors: false, textSettings: .textSettings(), xcodeProjectName: nil),
            targets: allTargets
        )
    }
}
