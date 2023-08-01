//
//  DependencyContainer.swift
//  NewsApp
//
//  Created by Burak Donat on 7/6/23.
//

import DependencyManagerKit
import NewsModuleInterface
import NewsDetailModuleInterface
import NewsModule
import NetworkKit
import NewsDetailModule
import ImageLoaderKit

final class DependencyContainer {

    func injectDependencies() {
        let dependencyEngine = DependencyEngine.shared

        dependencyEngine.register(value: NewsRouter(), for: NewsModuleInterface.self)
        dependencyEngine.register(value: NewsAPIClient(), for: NewsAPINetworkable.self)
        dependencyEngine.register(value: NewsDetailRouter(), for: NewsDetailModuleInterface.self)
        dependencyEngine.register(value: ImageLoader(), for: ImageLoadable.self)
    }
}
