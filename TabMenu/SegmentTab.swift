//
//  SegmentTab.swift
//  TabMenu
//
//  Created by lvlinqing on 15/12/18.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class SegmentTab:BaseTabView {

    //滑动的控件背景色
    var controlViewColor = getColor(255, green: 255, blue: 255,alpha:1)
    var controlView:UIView?
    

    //圆角度
    var padding:CGFloat = 2.0
    var cornerRadius:CGFloat = 2.0

    var controlViewAlpha:CGFloat = 0.0{
        
        didSet{
            self.alphaChange()
        }
    }
    
    
     override init(frame: CGRect,with titles:[String]) {
        super.init(frame: frame,with:titles)
    
        (self.subviews[1] as! UIButton).selected = true
       
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
     override func initView(){
        super.initView()
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        addControlView()
      
    }
    
    private func addControlView(){
       
        let rect = CGRectMake(padding, padding, (self.frame.width-padding*2)/CGFloat(self.tabCount), self.frame.height-padding*2)
        controlView = UIView(frame:rect)
        print(controlView)
        controlView!.backgroundColor = controlViewColor
        controlView!.layer.cornerRadius = cornerRadius
        controlView!.layer.masksToBounds = true
        addSubview(controlView!)
    
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        super.scrollViewDidEndDecelerating(scrollView)
        controlViewAlpha = 1.0
       
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
       indicatorx = (scrollView.contentOffset.x/scrollView.frame.width)*((self.frame.width-padding*2)/CGFloat(tabCount))
      
       controlViewAlpha = (scrollView.contentOffset.x/scrollView.frame.width) - CGFloat(currentPage)
   

    }
    override func indicatorxChange() {
        controlView?.frame = CGRectMake(indicatorx+padding, padding, (self.frame.width-padding*2)/CGFloat(self.tabCount), self.frame.height-padding*2)
    }
 
    internal override  func showIndex(indexPage:Int){
        
        for i in 1...self.subviews.count-1{
            let btn = self.subviews[i] as! UIButton
            if i == indexPage{
                
                btn.selected = true
            }else{
                btn.selected = false
            }
        }
        
    }
    override func pageChange() {
        showIndex(currentPage+1)
    }
    
    func alphaChange(){
        
        if controlViewAlpha == 1.0 || controlViewAlpha == 0.0{
            
            self.controlView?.alpha = 1.0
        }else{
            self.controlView?.alpha = 0.5
        }
        

    }

}
