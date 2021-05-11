//
//  SceneDelegate.swift
//  DemoApp
//
//  Created by İnanç Er on 5.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        #if DEBUG
        // Short-circuit starting app if running unit tests
        guard ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else {
          return
        }
        #endif
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let viewModel = ListViewModel(productAPI: .live)
        let controller = ListViewController(viewModel)
        let navigationController = UINavigationController(
            rootViewController: controller
        )
        window?.rootViewController = navigationController
    }
}

