//
//  DetailViewModel.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import struct UIKit.IndexPath

import struct Api.Product

protocol DetailViewModelOutput: class {
    
}

final class DetailViewModel {
    
    private(set) var datasource: [String] = []
    
    weak var output: DetailViewModelOutput?
    
    // MARK: - Initialization
    init() {
        
    }
}

// MARK: Events
extension DetailViewModel {
    
}
