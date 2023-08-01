//
//  NewsViewModel.swift
//  NewsModule
//
//  Created by Burak Donat on 7/6/23.
//

import CommonKit
import NetworkKit
import DependencyManagerKit

private enum Constant {

}

enum NewsStateChange: StateChange {

    case newsFetched
}

protocol NewsViewModel {

    func addChangeHandler(_ handler: @escaping(NewsStateChange) -> Void)
    func getCellModel(at index: Int) -> NewsTableViewCellModel
    func getArticle(at index: Int) -> Article

    var numberOfRows: Int { get }
}

final class DefaultNewsViewModel: StatefulViewModel<NewsStateChange>, NewsViewModel {

    @Dependency var apiModule: NewsAPINetworkable
    private var articles: [Article] = []

    override init() {
        super.init()

        didAddChangeHandler = { [weak self] in
            self?.publishInitialChange()
        }
    }

}

// MARK: - Initial State Change

private extension DefaultNewsViewModel {

    func publishInitialChange() {
        fetchNews()
    }
}

// MARK: - NewsViewModel

extension DefaultNewsViewModel {

    var numberOfRows: Int {
        return articles.count
    }

    func getCellModel(at index: Int) -> NewsTableViewCellModel {
        let article = articles[index]
        let model = NewsTableViewCellModel(title: article.title,
                                           description: article.description ?? "",
                                           id: article.source.id ?? "",
                                           artworkUrl: article.urlToImage ?? "")
        return model
    }

    func getArticle(at index: Int) -> Article {
        let article = articles[index]
        return article
    }
}

// MARK: - Network calls

extension DefaultNewsViewModel {

    func fetchNews() {
        apiModule.getNews { [weak self] response in
            switch response {
            case .success(let news):
                self?.articles = news.articles
                self?.emit(change: .newsFetched)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
