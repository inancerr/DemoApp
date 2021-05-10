//
//  ListViewController.swift
//  DemoApp
//
//  Created by İnanç Er on 5.05.2021.
//

import class Foundation.NSCoder

import class UIKit.UIViewController
import class UIKit.UICollectionView
import class UIKit.UICollectionViewCell
import class UIKit.UICollectionViewLayout
import struct UIKit.CGSize
import struct UIKit.IndexPath
import protocol UIKit.UICollectionViewDelegate
import protocol UIKit.UICollectionViewDataSource
import protocol UIKit.UICollectionViewDelegateFlowLayout

import func Utility.with

import struct Api.Product

class ListViewController: UIViewController {

    // MARK: - Properties
    private lazy var viewSource = with(ListView()) {
        $0.collectionView.dataSource = self
        $0.collectionView.delegate = self
    }
    
    private let viewModel: ListViewModel
    
    // MARK: - Initialization
    init(viewModel: ListViewModel) {
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
        viewModel.getProductList()
    }
}

// MARK: - ListViewModel Output
extension ListViewController: ListViewModelOutput {
    func reloadList() {
        viewSource.collectionView.reloadData()
    }
    
    func showProductDetail(
        _ product: Product
    ) {
        let controller = DetailViewController(viewModel: DetailViewModel())
        navigationController?.pushViewController(
            controller,
            animated: true
        )
    }
}

// MARK: - CollectionView Delegate
extension ListViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        viewModel.didSelectItemAt(indexPath)
    }
}

// MARK: - CollectionView Datasource
extension ListViewController: UICollectionViewDataSource {
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.datasource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: ListCell = collectionView.dequeue(at: indexPath)
        let product = viewModel.datasource[indexPath.row]
        cell.populate(with: product)
        return cell
    }
}

// MARK: - CollectionView Layout
extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.bounds.width - 4 * 2) / 2
        return CGSize(
            width: width,
            height: width * 1.2
        )
    }
}
