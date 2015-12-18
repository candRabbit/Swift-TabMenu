//
//  LineTab.swift
//  TabMenu
//
//  Created by 林青 吕 on 15/12/14.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class LineTab:BaseTabView{

    var padding:CGFloat = 0.0
    var lineColor = getColor(36, green: 206, blue: 252){
        didSet{
            
            if lineColor != oldValue{
               setNeedsDisplay()
            }
        }
    }
    
    override init(frame: CGRect, with titles: [String]) {
        super.init(frame: frame, with: titles)
        (self.subviews[0] as! UIButton).selected = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

 
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
       
        let context = UIGraphicsGetCurrentContext()

        CGContextAddRect(context, CGRectMake(indicatorx+padding, self.frame.height-2, (self.frame.width/CGFloat(self.subviews.count))-padding*2, 2))
           lineColor.setFill()
           CGContextFillPath(context)
        
    }
 
    override func indicatorxChange() {
        setNeedsDisplay()
    }
    

}
