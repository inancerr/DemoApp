//
//  File.swift
//  
//
//  Created by İnanç Er on 10.05.2021.
//

import UIKit

import class Foundation.URLSession
import class Foundation.URLSessionConfiguration
import struct Foundation.URL
import class UIKit.UIImage

import class UIKit.UIImageView

public extension UIImageView {
    func setImage(_ url: String) {
        ImageLoader.shared.loadImage(url) { [weak self] image in
            self?.image = image
        }
    }
}
