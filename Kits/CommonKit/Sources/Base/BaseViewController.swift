//
//  BaseViewController.swift
//  CommonKit
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit

// MARK: UIViewController

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

    }

    open override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)

        if self.isBeingDismissed || self.isMovingFromParent {
            self.viewWillBeRemoved()
        }
    }

    func viewWillBeRemoved() {
        // Subclasses should override.
    }
}
