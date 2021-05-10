//
//  DetailView.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class Foundation.NSCoder

import class UIKit.UIView
import class UIKit.UIImageView
import class UIKit.UIImage
import class UIKit.UILabel

import func Utility.with
import func Utility.vStack

import struct Entities.Product

final class DetailView: UIView {
    
    private let imageView = with(UIImageView()) {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
    }
    
    private let nameLabel = with(UILabel()) {
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private let detailLabel = with(UILabel()) {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.numberOfLines = 0
    }

    private lazy var stackView = vStack(
        space: 16
    )(
        imageView,
        nameLabel,
        detailLabel
    )

    init() {
        super.init(frame: .zero)
        addSubview(stackView)
        
        [
            stackView.alignTop(to: safeAreaLayoutGuide.topAnchor),
            stackView.alignLeading(to: self, offset: 15),
            stackView.alignTrailing(to: self, offset: -15),
            imageView.alignHeight(250)
        ]
        .activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension DetailView {
    func populate(with product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.description
        imageView.setImage(product.imageURL)
    }
}
