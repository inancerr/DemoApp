//
//  File.swift
//  
//
//  Created by İnanç Er on 7.05.2021.
//

import class UIKit.UIStackView
import class UIKit.UIView
import struct UIKit.CGFloat

public func vStack(
    distribution: UIStackView.Distribution = .fill,
    alignment: UIStackView.Alignment = .fill,
    space: CGFloat = 0,
    isBaselineRelativeArrangement: Bool = false,
    isLayoutMarginsRelativeArrangement: Bool = false
) -> (UIView...) -> UIStackView {
    { (views: UIView...) in
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.spacing = space
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        stackView.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return stackView
    }
}
