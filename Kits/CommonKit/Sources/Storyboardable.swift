//
//  Storyboardable.swift
//  CommonKit
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit

public enum StoryboardName: String {
    case news
    case newsDetail

    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
}

public protocol Storyboardable {
    static var storyboardIdentifier: String { get }
    static func instantiate(with storyboardName: StoryboardName, bundle: Bundle) -> Self
}

extension Storyboardable where Self: UIViewController {
    public static var storyboardIdentifier: String {
        String(describing: self)
    }
    public static func instantiate(with storyboardName: StoryboardName, bundle: Bundle) -> Self {
        guard let viewController = UIStoryboard(name: storyboardName.description, bundle: bundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("debug: instantiating is failed due to \(storyboardIdentifier)")
        }
        return viewController
    }
}

extension UIViewController: Storyboardable {
}
