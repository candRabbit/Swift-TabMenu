//
//  TabMenu.swift
//  TabMenu
//
//  Created by lvlinqing on 15/11/25.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class TabMenu: UIView {

    var delegate:TabMenuDelegate?
    var viewPager:ViewPager?
    var tabLayout:TabLayout?
    
    var tabViewHeight:CGFloat = 44
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    func initView(controller:UIViewController){

        tabLayout = TabLayout(frame: CGRectMake(0, 0, self.bounds.width, tabViewHeight), with: delegate!.getTitles())
        tabLayout!.backgroundColor = UIColor(red: 205.0/255, green: 205.0/255, blue: 205.0/255, alpha: 0.5)
        
        viewPager = ViewPager(frame: CGRectMake(0, tabViewHeight, self.bounds.width, self.bounds.height - tabViewHeight), with: delegate!.getControllers(), and: controller)
        
        viewPager!.viewPagerDelegate = tabLayout
        tabLayout!.tabLayoutDelegate = viewPager
        
        addSubview(tabLayout!)
        addSubview(viewPager!)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

protocol TabMenuDelegate{
    
    func getTitles()->[String]
    func getControllers()->[UIViewController]
}

