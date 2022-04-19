//
//  ViewController.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

import UIKit

import PROJECT

import MTRouterComponent
import MTModuleServiceComponent



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            self.navigationItem.title = "PROJECT Demo"

    }

    @IBAction func routerEvent(_ sender: Any) {
        print("---调用路由---")
        MTRouterComponent.shareInstance().openUrlInstance(CPDPROJECT_Swift_RouterDefine.demoPage(), fromVC: self, complete: nil)
    }
  

    @IBAction func serviceEvent(_ sender: Any) {
        print("---调用服务---")
    }
}

