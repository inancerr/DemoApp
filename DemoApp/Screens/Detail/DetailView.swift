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

final class DetailView: UIView {
    
    private let imageView = with(UIImageView()) {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
        $0.image = UIImage(named: "product")
    }
    
    private let nameLabel = with(UILabel()) {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
        $0.text = "This is title"
    }
    
    private let priceLabel = with(UILabel()) {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textAlignment = .center
        $0.text = "28$"
    }

    private lazy var stackView = vStack(
        space: 8
    )(
        imageView,
        nameLabel,
        priceLabel
    )

    init() {
        super.init(frame: .zero)
        addSubview(stackView)
        
        [
            stackView.alignTop(to: safeAreaLayoutGuide.topAnchor),
            stackView.alignLeading(to: self, offset: 5),
            stackView.alignTrailing(to: self, offset: 5),
            nameLabel.alignHeight(25),
            priceLabel.alignHeight(25)
        ]
        .activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
