//
//  File.swift
//  
//
//  Created by İnanç Er on 7.05.2021.
//

import class UIKit.UICollectionView
import struct UIKit.IndexPath

// MARK: - Dequeue
public extension UICollectionView {
    func dequeue<T: ViewIdentifier>(at indexPath: IndexPath) -> T {
        guard
            let cell = self.dequeueReusableCell(
                withReuseIdentifier: T.viewIdentifier,
                for: indexPath
            ) as? T
        else {
            fatalError("can not deque cell with identifier \(T.viewIdentifier) from tableView \(self)")
        }
        return cell
    }
    
    func register<T: ViewIdentifier>(type: T.Type) {
        self.register(
            T.self,
            forCellWithReuseIdentifier: T.viewIdentifier
        )
    }
}
