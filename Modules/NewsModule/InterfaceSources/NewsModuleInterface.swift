//
//  NewsModuleInterface.swift
//  NewsModule
//
//  Created by Burak Donat on 7/6/23.
//  Copyright © 2023 MyOrg. All rights reserved.
//

import UIKit

public protocol NewsModuleInterface {
    func createModule(using navigationController: UINavigationController?) -> UIViewController
}
