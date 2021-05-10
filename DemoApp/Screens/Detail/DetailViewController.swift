//
//  DetailViewController.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class Foundation.NSCoder

import class UIKit.UIViewController

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    private let viewSource = DetailView()
    
    private let viewModel: DetailViewModel
    
    // MARK: - Initialization
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = viewSource
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.output = self
    }
}

// MARK: - DetailViewModel Output
extension DetailViewController: DetailViewModelOutput {
    
}
