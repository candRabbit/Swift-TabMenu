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
    var nomalTab:NormalTab?
    var lineTab:LineTab?
    
    var tabViewHeight:CGFloat = 44
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    func initTab(tabStyle:TabMenuStyle = TabMenuStyle.Normal,controller:UIViewController){
        
        var tabRect:CGRect
        
        viewPager = ViewPager(frame:CGRectMake(0, 0, 0, 0), with: delegate!.getControllers(), and:controller)
     
        switch tabStyle{
            
            case .Normal:
            
               tabRect = CGRectMake(0, 0, 100, 30)
               viewPager!.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
               nomalTab = NormalTab(frame:tabRect, with:delegate!.getTitles())
               viewPager?.viewPagerDelegate = nomalTab
               controller.navigationItem.titleView = nomalTab
            
             case .Scroll:
            
                tabRect = CGRectMake(0, 0, self.bounds.width, tabViewHeight)
                viewPager!.frame = CGRectMake(0, tabViewHeight, self.bounds.width, self.bounds.height - tabViewHeight)
                tabLayout = TabLayout(frame: tabRect, with: delegate!.getTitles())
                tabLayout?.backgroundColor = UIColor.whiteColor()
                viewPager?.viewPagerDelegate = tabLayout
                tabLayout?.tabDelegate = viewPager
                addSubview(tabLayout!)
         
             case .BottomLine:
                tabRect = CGRectMake(0, 0, self.bounds.width, tabViewHeight)
                viewPager!.frame = CGRectMake(0, tabViewHeight, self.bounds.width, self.bounds.height - tabViewHeight)
                lineTab = LineTab(frame: tabRect, with: delegate!.getTitles())
                lineTab?.backgroundColor = UIColor.whiteColor()
                lineTab?.tabDelegate = viewPager
                viewPager?.tabScrollDelegate = lineTab
                addSubview(lineTab!)
            
        }
        
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

enum TabMenuStyle{
    
    case Normal,Scroll,BottomLine
}

