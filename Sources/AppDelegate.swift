//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit
import DependencyManagerKit
import NewsModuleInterface
import CommonKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let dependencyContainer = DependencyContainer()
        dependencyContainer.injectDependencies()

        @Dependency var rootModule: NewsModuleInterface
        let root = rootModule.createModule(using: nil)

        let navigationController = UINavigationController(rootViewController: root)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
// MARK: - Method
extension AppDelegate {
    func changeRootViewController(window: UIWindow?, _ vc: UIViewController, animated: Bool = true) {
        guard let window = window else {
            return
        }

        window.rootViewController = vc
        if animated {
            UIView.transition(
                with: window,
                duration: 0.5,
                options: [.transitionFlipFromBottom],
                animations: nil,
                completion: nil
            )
        }
    }
}
