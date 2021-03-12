//
//  AppDelegate.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var appCoordinator:AppCoordinator?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.goNext()
    IQKeyboardManager.shared.enableAutoToolbar = false
    IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Listo"
    
    let navController = UINavigationController()
    appCoordinator = AppCoordinator(navigationController: navController)
    appCoordinator?.start()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    
    LocationBanamex.share.locationManager.requestWhenInUseAuthorization()
    return true
  }
  
  
}

