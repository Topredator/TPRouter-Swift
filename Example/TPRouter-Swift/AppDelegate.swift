//
//  AppDelegate.swift
//  TPRouter-Swift
//
//  Created by 周晓路 on 08/30/2021.
//  Copyright (c) 2021 周晓路. All rights reserved.
//

import UIKit
import TPRouter_Swift
import TPUIKit_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        routeRegister()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let navi = BaseNavigationController(rootViewController: ViewController())
        navi.navigationBar.isTranslucent = false
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }
    
    func routeRegister() {
        /*
         情景1、使用正则表达式方式注册 xxx/:name1/:name2([0-9]+)
            正则表达式 作用：指定 传入参数的格式要求 (name1、name2为参数名)
            使用: xxx/xxx/123
         */
        Router.shared.register("gotoSecond/:name/:sex([0-9]+)") {
            let vc = SecondVC()
            if let name = $0["name"] as? String, let sex = $0["sex"] {
                vc.title = name + "\(sex)"
            }
            Navigator.push(vc)
        }
        /*
         情景2、path 直接注册 xxxx/xxxx/xxxx
         使用时分两种：a、path?param=[String: Any]
                            b、url: path  parameters: [String: Any]
         */
        Router.shared.register("gotoSecond") {
            let vc = SecondVC()
            if let name = $0["name"] as? String, let sex = $0["sex"] {
                vc.title = name + "\(sex)"
            }
            Navigator.push(vc)
        }
        
        
    }

}

