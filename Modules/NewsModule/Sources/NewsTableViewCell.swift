//
//  NewsTableViewCell.swift
//  NewsModule
//
//  Created by Burak Donat on 7/10/23.
//

import UIKit
import NewsFavKit
import ImageLoaderKit
import DependencyManagerKit

protocol NewsTableViewCellDelegate: AnyObject {

    func favTapped()
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var favButton: UIButton!
    @IBOutlet private weak var newsImage: UIImageView!

    private var model: NewsTableViewCellModel!
    weak var delegate: NewsTableViewCellDelegate?
    @Dependency var imageLoader: ImageLoadable

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func configure(with model: NewsTableViewCellModel) {
        self.model = model
        titleLabel.text = model.title
        descriptionLabel.text = model.description

        if let url = URL(string: model.artworkUrl) {
            imageLoader.loadImage(imageView: newsImage, with: url)
        }
        configureFavButton()
    }

    private func configureUI() {
        titleLabel.textColor = .darkText
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
    }

    private func configureFavButton() {
        let isFav = UserDefaults.favNewsID.contains(model.id)
        let favImage = isFav ? NewsModuleAsset.favFilled.image : NewsModuleAsset.favEmpty.image
        favButton.setImage(favImage, for: .normal)
    }

    @IBAction func favButtonTapped(_ sender: UIButton) {
        let newsId = model.id
        var favNewsID = UserDefaults.favNewsID

        if !favNewsID.contains(newsId) {
            favNewsID.append(newsId)
        } else {
            favNewsID = favNewsID.filter {$0 != newsId}
        }

        UserDefaults.favNewsID = favNewsID
        delegate?.favTapped()
    }

}
