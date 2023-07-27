//
//  NewsDetailViewController.swift
//  NewsDetailModule
//
//  Created by Burak Donat on 7/6/23.
//

import UIKit
import CommonKit
import NewsDetailModuleInterface

public final class NewsDetailViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    // MARK: - Properties

    var viewModel: NewsDetailViewModel!
    var router: NewsDetailRouter!

    public override func viewDidLoad() {
        super.viewDidLoad()

        addStateChangeHandler()
    }
    
}

// MARK: - State Change

private extension NewsDetailViewController {

    func addStateChangeHandler() {
        DispatchQueue.main.async {
            self.viewModel.addChangeHandler { [weak self] change in
                self?.applyStateChange(change)
            }
        }
    }

    func applyStateChange(_ change: NewsDetailStateChange) {
        switch change {
        case .initial(model: let model):
            titleLabel.text = model.title
            descriptionLabel.text = model.description
        }
    }
}
