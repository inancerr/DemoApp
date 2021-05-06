//
//  ListViewController.swift
//  DemoApp
//
//  Created by İnanç Er on 5.05.2021.
//

import UIKit

class ListViewController: UIViewController {

    private let viewSource = ListView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
