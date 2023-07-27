//
//  ImageLoader.swift
//  ImageLoaderKit
//
//  Created by Burak Donat on 7/10/23.
//

import SDWebImage
import UIKit

public protocol ImageLoadable {
    func loadImage(imageView: UIImageView, with url: URL)
}

public class ImageLoader: ImageLoadable {

    public init() {}

    public func loadImage(imageView: UIImageView, with url: URL) {
        imageView.sd_setImage(with: url)
    }
}
