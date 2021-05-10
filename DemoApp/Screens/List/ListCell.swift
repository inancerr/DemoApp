//
//  ListCell.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class Foundation.NSCoder

import struct UIKit.CGRect
import class UIKit.UICollectionViewCell
import class UIKit.UIImageView
import class UIKit.UIScreen
import class UIKit.UIImage
import class UIKit.UILabel

import func Utility.with
import func Utility.vStack

import struct Entities.Product

final class ListCell: UICollectionViewCell {
    
    private let imageView = with(UIImageView()) {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
    }
    
    private let nameLabel = with(UILabel()) {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
    }
    
    private let priceLabel = with(UILabel()) {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textAlignment = .center
    }

    private lazy var stackView = vStack(
        space: 8
    )(
        imageView,
        nameLabel,
        priceLabel
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stackView)
        
        [
            stackView.alignFitEdges(insetedBy: 4),
            [
                nameLabel.alignHeight(25),
                priceLabel.alignHeight(25)
            ]
        ]
        .flatMap { $0 }
        .activate()
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension ListCell {
    func populate(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.price.formattedAsPrice
        imageView.setImage(product.imageURL)
    }
}
