//
//  SceneDelegate.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let appCoordinator = AppCoordinator()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        window.rootViewController = appCoordinator.rootViewController
        self.window = window
        // Make Key and Visible
        window.makeKeyAndVisible()
        
        // Start Coordinator
        appCoordinator.start()

    }
}

