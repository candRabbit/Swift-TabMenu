//
//  BaseTabView.swift
//  TabMenu
//
//  Created by lvlinqing on 15/12/18.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class BaseTabView: UIView,TabScrollDelegate{
    //Tab背景色
    var tabBackgroundColor = getColor(36, green: 182, blue: 252)
    var tabDelegate:TabDelegate?
    var textNomalColor = UIColor.grayColor()
    var textSelectColor = getColor(36, green: 206, blue: 252)
    var tabCount = 0
    var currentPage = 0{
        
        didSet{
            if currentPage != oldValue{
                self.pageChange()
            }
        }
    }
    
    var indicatorx:CGFloat = 0.0{
        
        didSet{
            if indicatorx != oldValue{
                self.indicatorxChange()
            }
        }
    }
    
    init(frame: CGRect,with titles:[String]) {
        super.init(frame: frame)
        tabCount = titles.count
        initView()
        initTab(titles)
      
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView(){
        
       self.backgroundColor = tabBackgroundColor
    }
    
    private func initTab(titles:[String]){
        
        let btnWidth = self.frame.width/CGFloat(tabCount)
        
        for i in 0...tabCount-1{
            
            let btn = UIButton(frame: CGRectMake(CGFloat(i)*btnWidth, 0, btnWidth, frame.height))
            btn.setTitle(titles[i], forState: UIControlState.Normal)
            btn.setTitleColor(textNomalColor, forState: UIControlState.Normal)
            btn.setTitleColor(textSelectColor, forState: UIControlState.Selected)
            btn.titleLabel?.font = UIFont.systemFontOfSize(15)
            btn.tag = i
            btn.addTarget(self, action: Selector("click:"), forControlEvents: UIControlEvents.TouchUpInside)
            addSubview(btn)
        }
       

    }
    
    func click(sender:UIButton){
        let index = sender.tag
        tabDelegate?.showIndex(index)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    indicatorx = (scrollView.contentOffset.x/scrollView.frame.width)*(self.frame.width/CGFloat(tabCount))
    currentPage = Int(floor(scrollView.contentOffset.x/scrollView.frame.width - 0.5)+1)
    }
    
    //指示器位置改变发生回调
    func indicatorxChange(){
        
    }
    //页码改变时发生回调
    func pageChange(){
        showIndex(currentPage)
    }
    
    func showIndex(indexPage:Int){
        
        for i in 0...self.subviews.count-1{
            let btn = self.subviews[i] as! UIButton
            if i == indexPage{
                
                btn.selected = true
            }else{
                btn.selected = false
            }
        }
        
    }

    
}
