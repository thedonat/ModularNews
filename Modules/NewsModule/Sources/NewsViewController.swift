//
//  NewsViewController.swift
//  NewsModule
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit
import CommonKit

final class NewsViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var viewModel: NewsViewModel = DefaultNewsViewModel()
    private var router = NewsRouter()

    override func viewDidLoad() {
        super.viewDidLoad()

        addStateChangeHandler()
        title = "News"
    }
}

// MARK: - Helpers

private extension NewsViewController {

    func configureTableView() {
        tableView.registerCell(type: NewsTableViewCell.self, bundle: .module)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - State Change

private extension NewsViewController {

    func addStateChangeHandler() {
        DispatchQueue.main.async {
            self.viewModel.addChangeHandler { [weak self] change in
                self?.applyStateChange(change)
            }
        }
    }

    func applyStateChange(_ change: NewsStateChange) {
        switch change {
        case .newsFetched:
            configureTableView()
            tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: NewsTableViewCell.self, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }

        let model = viewModel.getCellModel(at: indexPath.row)
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }

}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.getArticle(at: indexPath.row)
        router.route(to: .newsDetail(model: model), from: self)
    }

}

// MARK: - NewsTableViewCellDelegate

extension NewsViewController: NewsTableViewCellDelegate {

    func favTapped() {
        tableView.reloadData()
    }
}
