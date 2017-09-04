//
//  ViewController.swift
//  DLPopMenuDemo
//
//  Created by Gordon on 2017/8/31.
//  Copyright © 2017年 Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var menuView: LYPopMenuView?
    var items = [LYPopMenuModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        for idx in 0...3 {
            let model = LYPopMenuModel()
            model.title = "标题\(idx)"
            model.imageName = "popmenu_icon"
            items.append(model)
        }
        
    }
    
    
   
    // MARK: - ********* 点击 style
    @IBAction func actionStyleBtn(_ sender: UIButton) {
        
        menuView = LYPopMenuView.init(sender: sender, style: LYPopMenuStyle(), items: items)
        menuView?.action = {
            print("==== action click >>>\($0)")
        }
        
        switch sender.currentTitle ?? "" {
        case "style 1":
            print("==== style 1 ")
            menuView?.show()
        case "style 2":
            print("==== style 2 ")
            menuView?.show()
        case "style 3":
            print("==== style 3 ")
            menuView?.show()
        case "style 4":
            print("==== style 4 ")
            menuView?.show()
        case "style 5":
            print("==== style 5 ")
            menuView?.show()
        default:
            print(" something error ")
        }
    }

}

