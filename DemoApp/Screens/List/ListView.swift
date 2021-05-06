//
//  ListView.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class Foundation.NSCoder

import class UIKit.UIView
import class UIKit.UICollectionView
import class UIKit.UICollectionViewFlowLayout

import func Utility.with

final class ListView: UIView {
    
    private lazy var layout = with(UICollectionViewFlowLayout()) {
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 0
        $0.minimumLineSpacing = 4
        $0.sectionInset = .init(
            top: 10,
            left: 4,
            bottom: 10,
            right: 4
        )
    }
    
    lazy var collectionView = with(
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
    ) {
        $0.register(type: ListCell.self)
        $0.backgroundColor = .clear
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(collectionView)
        collectionView.alignFitEdges().activate()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
