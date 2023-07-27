//
//  NewsViewModel.swift
//  NewsDetailModule
//
//  Created by Burak Donat on 7/6/23.
//

import CommonKit
import NetworkKit
import DependencyManagerKit
import NewsDetailModuleInterface

private enum Constant {

}

enum NewsDetailStateChange: StateChange {

    case initial(model: NewsDetailModel)
}

protocol NewsDetailViewModel {

    func addChangeHandler(_ handler: @escaping(NewsDetailStateChange) -> Void)
}

final class DefaultNewsDetailViewModel: StatefulViewModel<NewsDetailStateChange>, NewsDetailViewModel {

    private var model: NewsDetailModel

    public init(model: NewsDetailModel) {
        self.model = model
        super.init()

        didAddChangeHandler = { [weak self] in
            self?.publishInitialChange()
        }
    }

}


// MARK: - Initial State Change

private extension DefaultNewsDetailViewModel {

    func publishInitialChange() {
        emit(change: .initial(model: model))
    }
}
