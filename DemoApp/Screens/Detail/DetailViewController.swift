//
//  DetailViewController.swift
//  DemoApp
//
//  Created by İnanç Er on 7.05.2021.
//

import class UIKit.UIViewController

final class DetailViewController: UIViewController {
    
    private let viewSource = DetailView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = viewSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
