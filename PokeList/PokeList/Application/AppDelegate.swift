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
        
        let rootViewController = factory?.makeHome()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
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

