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
import class Foundation.NSCache
import class Foundation.NSString
import class UIKit.UIImage

class ImageLoader {
    static let shared = ImageLoader()
    var cache = NSCache<NSString, UIImage>()
    
    func loadImage(_ url: String, completion: @escaping (UIImage) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let _url = URL(string: url) else { return }
            if let image = self?.cache.object(forKey: NSString(string: url)) {
                DispatchQueue.main.async {
                    completion(image)
                }
                return
            }
            guard let _data = try? Data(contentsOf: _url),
                  let image = UIImage(data: _data) else { return }
            self?.cache.setObject(image, forKey: NSString(string: url))
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
