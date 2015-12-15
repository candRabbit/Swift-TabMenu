//
//  LineTab.swift
//  TabMenu
//
//  Created by 林青 吕 on 15/12/14.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class LineTab: UIView,TabScrollDelegate{

    var tabDelegate:TabDelegate?
    var currentPage = 0
    var padding:CGFloat = 0.0
    var lineColor = getColor(36, green: 206, blue: 252){
        
        didSet{
            
            if lineColor != oldValue{
                
                setNeedsDisplay()
            }
        }
    }
    var indicatorx:CGFloat = 0.0{
        
        didSet{
            if indicatorx != oldValue{
                
                setNeedsDisplay()
            }
        }
    }
    var textNomalColor = UIColor.grayColor()
    var textSelectColor = getColor(36, green: 206, blue: 252)
 
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
       
        let context = UIGraphicsGetCurrentContext()

        CGContextAddRect(context, CGRectMake(indicatorx+padding, self.frame.height-2, (self.frame.width/CGFloat(self.subviews.count))-padding*2, 2))
           lineColor.setFill()
           CGContextFillPath(context)
        
    }
  
    
    init(frame: CGRect,with titles:[String]) {
        super.init(frame: frame)
        setTabs(titles)
        
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    private func setTabs(titles:[String]){
        // println(self.frame.width,self.frame.height)
        let count = titles.count
        
        let width = (self.frame.width)/CGFloat(count)
        
        for i in 0...count-1{
          
            let tab = UIButton(frame:CGRectMake(width*CGFloat(i), 0, width, self.frame.height))
            tab.setTitle(titles[i], forState: UIControlState.Normal)
            tab.setTitleColor(textNomalColor, forState: UIControlState.Normal)
            tab.setTitleColor(textSelectColor, forState: UIControlState.Selected)
            tab.titleLabel?.font = UIFont.boldSystemFontOfSize(14.0)
            tab.titleLabel?.textAlignment = NSTextAlignment.Center
            tab.tag = i
            tab.addTarget(self, action: Selector("btnClick:"), forControlEvents: UIControlEvents.TouchUpInside)
            addSubview(tab)
        }
        (self.subviews[0] as! UIButton).selected = true
        
    }

    func btnClick(sender:AnyObject){
        
        if (sender as! UIButton).selected{
            return
        }
        currentPage = sender.tag
        tabDelegate?.showIndex(currentPage)
        showIndex(currentPage)
        
    }
 
    
    //mark 
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        indicatorx = (scrollView.contentOffset.x/scrollView.frame.width)*(self.frame.width/CGFloat(self.subviews.count))
     
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let currentPage = scrollView.contentOffset.x/scrollView.frame.width
        let index = Int(currentPage)
        self.currentPage = index
        showIndex(self.currentPage)
        
    }
    
    func showIndex(page:Int){
        for (var i = 0 ;i<self.self.subviews.count;i++){
            
            if page == i {
                let label = self.subviews[i] as! UIButton
                label.selected = true
            }else{
                let label = self.subviews[i] as! UIButton
                label.selected = false
            }
        }
    }
    

}
