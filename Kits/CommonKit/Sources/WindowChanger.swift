//
//  WindowChanger.swift
//  CommonKit
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit

public protocol WindowChangerInterface {
    func changeRootViewController(_ vc: UIViewController, animated: Bool)
}

public final class WindowChanger: WindowChangerInterface {
    public static let shared = WindowChanger()

    private init() {}

    public var window: UIWindow?

    public func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
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
        window.makeKeyAndVisible()
    }
}
