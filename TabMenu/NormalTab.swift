//
//  NormalTab.swift
//  TabMenu
//
//  Created by 林青 吕 on 15/12/14.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class NormalTab: UIScrollView ,ViewPagerDelegate{

    
    init(frame: CGRect,with titles:[String]) {
        super.init(frame: frame)
        scrollSet()
        initTabWithTitles(titles)
        
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initTabWithTitles(titles:[String]){
    
        let scrollWidth = self.frame.width
        let scrollHeight = self.frame.height
        for i in 0...titles.count - 1{
            let label = UILabel(frame: CGRectMake(CGFloat(i)*scrollWidth,0,scrollWidth,scrollHeight))
            label.font = UIFont.systemFontOfSize(18)
            label.textColor = UIColor.whiteColor()
            label.textAlignment = NSTextAlignment.Center
            label.text = titles[i]
            addSubview(label)
        }
        self.contentSize = CGSizeMake(scrollWidth*CGFloat(titles.count), 0)
    }
    
    private func scrollSet(){
        
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.userInteractionEnabled = false
        self.pagingEnabled = true
        
    }
    
    func scrolled(page: Int) {
        
        self.setContentOffset(CGPointMake(CGFloat(page)*self.frame.width, 0), animated: true)
    }
    func scroll(page: Int, offset: CGFloat) {
        
    }

}
