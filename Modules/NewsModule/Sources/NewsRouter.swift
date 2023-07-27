//
//  NewsRouter.swift
//  NewsModule
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit
import DependencyManagerKit
import NewsModuleInterface
import NewsDetailModuleInterface
import NetworkKit

enum NewsRoute {

    case newsDetail(model: Article)
}

protocol NewsRouterProtocol {

    func route(to route: NewsRoute,
               from context: NewsViewController)
}

public final class NewsRouter: NewsRouterProtocol, NewsModuleInterface {

    public init() {}

    public func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let view = NewsViewController.instantiate(with: .news, bundle: .module)
        return view
    }

    func route(to route: NewsRoute,
               from context: NewsViewController) {
        switch route {
        case .newsDetail(let model):
            @Dependency var newsDetailModule: NewsDetailModuleInterface
            let vc = newsDetailModule.createModule(using: context.navigationController,
                                                   model: NewsDetailModel(title: model.name,
                                                                          description: model.artistName))
            context.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
