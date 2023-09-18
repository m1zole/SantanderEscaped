//
//  AppDelegate.swift
//  Santander
//
//  Created by Serena on 21/06/2022
//
	

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    @State private var kfd: UInt64 = 0
    
    @State private var puafPages = 2048
    @State private var puafMethod = 1
    @State private var kreadMethod = 1
    @State private var kwriteMethod = 1

    @State private var enableHideHomebar = false
    @State private var enableHideDock = false
    @State private var enableResSet = false
    @State private var enableReplacecert = true
    @State private var enableCustomSysColors = false
    @State private var changeRegion = false
    @State private var whitelist = false
    @State private var supervise = false
    @State private var enableCustomFont = false
    
    var puafPagesOptions = [16, 32, 64, 128, 256, 512, 1024, 2048]
    var puafMethodOptions = ["physpuppet", "smith"]
    var kreadMethodOptions = ["kqueue_workloop_ctl", "sem_open"]
    var kwriteMethodOptions = ["dup", "sem_open"]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        kfd = do_kopen(UInt64(puafPages), UInt64(puafMethod), UInt64(kreadMethod), UInt64(kwriteMethod))
        if(kfd == 0) {
            usleep(1000)
            do_fun()
        }
        usleep(1000)
        do_kclose()
        UIApplication.shared.alert(title: "pwn", body: "DONE", withButton: true)
        if UserPreferences.displayRecentlyBookmarked {
            application.setShortcutItems(intoURLs: UserPreferences.bookmarks)
        } else {
            application.shortcutItems = []
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

