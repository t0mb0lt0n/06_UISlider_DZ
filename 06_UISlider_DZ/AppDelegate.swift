//
//  AppDelegate.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 13.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //generate main VC
        let mainVC = SongsListController()
        let navController = UINavigationController(rootViewController: mainVC)
        //navController.setNavigationBarHidden(true, animated: true) //another comment
        //navController.setNavigationBarHidden(true, animated: true)
        //navController.setNavigationBarHidden(true, animated: true)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }



}

