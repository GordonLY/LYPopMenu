//
//  ViewController.swift
//  DLPopMenuDemo
//
//  Created by Gordon on 2017/8/31.
//  Copyright © 2017年 Gordon. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    var menuView1: LYPopMenuView?
    var menuView2: LYPopMenuView?
    var menuView3: LYPopMenuView?
    var menuView4: LYPopMenuView?
    var menuView5: LYPopMenuView?
    var items = [LYPopMenuModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.p_initConfig()
    }
    
    func p_initConfig() {
        for idx in 0...3 {
            let model = LYPopMenuModel()
            model.title = "标题\(idx)"
            model.imageName = "popmenu_icon"
            items.append(model)
        }
    }
    
    // MARK: - ********* 点击 style
    @IBAction func actionStyleBtn(_ sender: UIButton) {
        
        switch sender.currentTitle ?? "" {
        case "style 1":
            menuView1 = LYPopMenuView.menu(sender: sender, style: LYPopMenuStyle(), items: items, type: .upside)
            menuView1?.action = {
                print("==== action click >>>\($0)")
            }
            menuView1?.show()
        case "style 2":
            menuView2 = LYPopMenuView.menu(sender: sender, style: LYPopMenuStyle(), items: items, type: .upsidedown)
            menuView2?.action = {
                print("==== action click >>>\($0)")
            }
            menuView2?.show()
        case "style 3":
            menuView3 = LYPopMenuView.menu(sender: sender, style: LYPopMenuStyle(), items: items, type: .upsidedown)
            menuView3?.action = {
                print("==== action click >>>\($0)")
            }
            menuView3?.show()
        case "style 4":
            menuView4 = LYPopMenuView.menu(sender: sender, style: LYPopMenuStyle(), items: items, type: .upside)
            menuView4?.action = {
                print("==== action click >>>\($0)")
            }
            menuView4?.show()
        case "style 5":
            var style = LYPopMenuStyle()
            style.coverColor = UIColor.clear
            style.menuBgColor = UIColor.init(white: 0, alpha: 0.8)
            style.titleColor = UIColor.white
            style.cellHighlightColor = UIColor.init(white: 0, alpha: 1)
            style.separateColor = UIColor.init(red: 83.0/255, green: 83.0/255, blue: 83.0/255, alpha: 1)
            style.separateMargin = (12,12)
            
            menuView5 = LYPopMenuView.menu(sender: sender, style: style, items: items, type: .upsidedown)
            menuView5?.action = {
                print("==== action click >>>\($0)")
            }
            menuView5?.show()
        default:
            print(" something error ")
        }
    }
}

