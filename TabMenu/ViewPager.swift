//
//  ViewPager.swift
//  TabMenu
//
//  Created by lvlinqing on 15/11/25.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class ViewPager: UIScrollView,UIScrollViewDelegate,TabDelegate{

    var tabMenuDelegate:TabMenuDelegate?
    var viewPagerDelegate:ViewPagerDelegate?
    var tabScrollDelegate:TabScrollDelegate?
    
    var controllers:[UIViewController]?
    var controller:UIViewController?
    //存放已经加载的controller
    var actionControllers = [UIViewController]()
    
    //当前的page
    var currentPage = 0
    //滚动百分比
    var page0ffset:CGFloat = 0.0
    
    init(frame: CGRect,with controllers:[UIViewController],and controller:UIViewController) {
        super.init(frame: frame)
        self.controllers = controllers
        self.controller = controller
        self.delegate = self
        initController()
        initSetting()
        
    }
    
    private func initSetting(){
        self.bounces = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        pagingEnabled = true
      
       
    }
    
    override func layoutSubviews() {
         contentSize = CGSizeMake(self.bounds.width*CGFloat(controllers!.count), 0)
    }
    
    private func initController(){
        
        if(controllers?.count > 0){
          let viewController = controllers![0]
           viewController.view.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
            controller?.addChildViewController(viewController)
            addSubview(viewController.view)
            actionControllers.append(viewController)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 当addChildViewController 的时候viewController就会加载 所以这里
    // 应当滚动当前页面的时候才加载
    // 要实现连带滚动的效果就必须实现 滚动百分比
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let scrollViewBounds = scrollView.bounds
        let width = CGRectGetWidth(scrollViewBounds)
        let maxX = CGRectGetMaxX(scrollViewBounds)
        
        var nextIndex = Int(maxX/width)
        if nextIndex >= controllers?.count{
            nextIndex = (controllers?.count)! - 1
        }
        let viewController = controllers![nextIndex]
        if !actionControllers.contains(viewController){
           controller?.addChildViewController(viewController)
           viewController.view.frame = CGRectMake(CGFloat(nextIndex)*width,0,width, scrollViewBounds.height)
           self.addSubview(viewController.view)
           actionControllers.append(viewController)
        }
        
        let nextPage = scrollView.contentOffset.x/scrollView.bounds.width
        if (currentPage != Int(nextPage)) && ((scrollView.contentOffset.x%scrollView.bounds.width) == 0){
            
            currentPage = Int(nextPage)
            self.viewPagerDelegate?.scrolled(currentPage)
            tabMenuDelegate?.showIndex(currentPage)
        }
        tabScrollDelegate?.scrollViewDidScroll(scrollView)

        
    }
    
    
    
    
    func showIndex(index: Int) {
        currentPage = index
        setContentOffset(CGPointMake(CGFloat(index)*self.frame.width, 0), animated: true)
        tabMenuDelegate?.showIndex(currentPage)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
       tabScrollDelegate?.scrollViewDidEndDecelerating(scrollView)
    }
}

protocol ViewPagerDelegate{
    
    func scroll(page:Int,offset:CGFloat)
    func scrolled(page:Int)
}
