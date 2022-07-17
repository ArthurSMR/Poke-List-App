//
//  AppDelegate.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
    private var factory: AppFactoryProtocol?
    
    func setupFactory() {
        self.factory = AppFactory()
    }

    func setupWindow() {
        
        guard let rootViewController = factory?.makeHome() else { return }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupFactory()
        setupWindow()
        
        return true
    }
}

