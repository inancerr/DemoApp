//
//  File.swift
//  
//
//  Created by İnanç Er on 10.05.2021.
//

import class Foundation.URLSession
import class Foundation.URLSessionConfiguration
import class Foundation.DispatchQueue
import struct Foundation.Data
import struct Foundation.URL
import class UIKit.UIImage

class ImageLoader {
    
    static let shared = ImageLoader()
    
    var cache: [URL: Data] = [:]
    
    func loadImage(_ url: String, completion: @escaping (UIImage) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let _url = URL(string: url) else { return }
            var data: Data?
            if let cacheData = self?.cache[_url] {
                data = cacheData
            } else if let _data = try? Data(contentsOf: _url) {
                data = _data
                self?.cache.updateValue(_data, forKey: _url)
            }
            guard let _data = data,
                  let image = UIImage(data: _data) else { return }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
