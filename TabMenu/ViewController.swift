//
//  ViewController.swift
//  TabMenu
//
//  Created by lvlinqing on 15/11/24.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

let width = UIScreen.mainScreen().bounds.width


class ViewController: UIViewController,TabMenuDelegate{

    var style:TabMenuStyle?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabMenu = TabMenu(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height-64))
        tabMenu.delegate = self
        tabMenu.initTab(style:style!,controller: self)
        self.view.addSubview(tabMenu)
        self.automaticallyAdjustsScrollViewInsets = false
        
       
      
        
   
    }
    
    func getTitles() -> [String] {
        return ["魔兽世界","剑网三","文章"]
    }
    
    func getControllers() -> [UIViewController] {
        
        var controllers = [UIViewController]()
        let newTabControllers = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabViewController") as! TabTableViewController
        newTabControllers.tabType = TabType.WOW
        
        let textTabControllers = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabViewController") as! TabTableViewController
        textTabControllers.tabType = TabType.XIAOYAO
        
        let newsTextTabControllers = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabViewController") as! TabTableViewController
        newsTextTabControllers.tabType = TabType.NewsText
        
        controllers.append(newTabControllers)
        controllers.append(textTabControllers)
        controllers.append(newsTextTabControllers)
        
        return controllers
    }

}

