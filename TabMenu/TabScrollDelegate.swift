//
//  TabScrollDelegate.swift
//  TabMenu
//
//  Created by 林青 吕 on 15/12/14.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

protocol TabScrollDelegate {

    func scrollViewDidScroll(scrollView:UIScrollView)
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
}
