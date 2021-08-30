//
//  ViewController.swift
//  TPRouter-Swift
//
//  Created by 周晓路 on 08/30/2021.
//  Copyright (c) 2021 周晓路. All rights reserved.
//

import UIKit
import TPRouter_Swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Route Home"
        setupSubviews()
    }

    func setupSubviews() {
        let btn = UIButton(frame: CGRect(x: 15.0, y: 100.0, width: 100, height: 35))
        btn.setTitle("跳转", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
        btn.addTarget(self, action: #selector(jumpAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func jumpAction() {
        // 使用 情景1
        Router.shared.use("gotoSecond/跳转/15")
        // 使用 场景 2-1
//        Router.shared.use("gotoSecond?name=\("跳转")&sex=\(9)")
        // 使用 场景 2-2
//        Router.shared.use("gotoSecond", parameters: ["name": "跳转", "sex": 9])
    }
    
}

