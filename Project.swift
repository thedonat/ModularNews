import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains NewsApp App target and NewsApp unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

func makeDependencies() -> [TargetDependency] {
    var dependencies: [TargetDependency] = []

    dependencies.append(contentsOf: [
        AllDependencies.Modules.newsModule,
        AllDependencies.Modules.newsDetailModule,

        AllDependencies.Kits.dependencyManagerKit,
        AllDependencies.Kits.commonKit,
        AllDependencies.Kits.networkKit,
        AllDependencies.Kits.newsFavKit,
        AllDependencies.Kits.imageLoaderKit
    ])
    return dependencies
}

// MARK: - Settings
let configurations: [Configuration] = [
    .debug(name: "Debug", xcconfig: .relativeToRoot(PathConstants.configPath.appending("NewsAppTarget.xcconfig"))),
    .release(name: "Release", xcconfig: .relativeToRoot(PathConstants.configPath.appending("NewsAppTarget.xcconfig")))
]
let settings: Settings = .settings(configurations: configurations)

// MARK: - Project
private let swiftlint = """
  export PATH="$PATH:/opt/homebrew/bin"
  if which swiftlint > /dev/null; then
    swiftlint --config .swiftlint.yml
  else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
  fi
  """
let appTarget = Target(
    name: "NewsApp",
    platform: .iOS,
    product: .app,
    bundleId: "com.burakdonat.NewsApp",
    infoPlist: "NewsApp.plist",
    sources: "Sources/**",
//    resources: "Resources/**",
    scripts: [
        .pre(script: swiftlint, name: "Run Swiftlint")
    ],
    dependencies: makeDependencies(),
    settings: settings
)

let project = Project(name: "NewsApp", options: .options(automaticSchemesOptions: .enabled(targetSchemesGrouping: .singleScheme, codeCoverageEnabled: true, testingOptions: .parallelizable), developmentRegion: nil, disableBundleAccessors: false, disableShowEnvironmentVarsInScriptPhases: false, disableSynthesizedResourceAccessors: false, textSettings: .textSettings(), xcodeProjectName: nil), targets: [appTarget])



