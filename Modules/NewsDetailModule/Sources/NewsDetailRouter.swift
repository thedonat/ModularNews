//
//  NewsDetailRouter.swift
//  NewsDetailModule
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit
import NewsDetailModuleInterface

enum NewsDetailRoute {

}

protocol NewsDetailRouterProtocol {

    func route(to route: NewsDetailRoute,
               from context: NewsDetailViewController)
}

public final class NewsDetailRouter: NewsDetailRouterProtocol, NewsDetailModuleInterface {

    public init() {}

    public func createModule(using navigationController: UINavigationController?, model: NewsDetailModel) -> UIViewController {
        let view = NewsDetailViewController.instantiate(with: .newsDetail, bundle: .module)
        let vm = DefaultNewsDetailViewModel(model: model)
        view.viewModel = vm
        return view
    }

    func route(to route: NewsDetailRoute,
               from context: NewsDetailViewController) {

    }
}
