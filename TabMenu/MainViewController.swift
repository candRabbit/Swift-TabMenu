//
//  MainViewController.swift
//  TabMenu
//
//  Created by lvlinqing on 15/12/15.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ViewController
        switch segue.identifier!{
            case "Normal":
            controller.style = TabMenuStyle.Normal
            case "Scroll":
            controller.style =  TabMenuStyle.Scroll
            case "BottomLine":
            controller.style =  TabMenuStyle.BottomLine
            case "segment":
            controller.style = TabMenuStyle.Segment
        default:
            break
        }
    }
   

}
