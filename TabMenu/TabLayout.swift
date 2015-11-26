//
//  TabLayout.swift
//  TabMenu
//
//  Created by lvlinqing on 15/11/26.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class TabLayout: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ViewPagerDelegate{

    var tabLayoutDelegate:TabLayoutDelegate?
    var textNomalColor = UIColor.grayColor()
    var textSelectColor = UIColor(red: 254.0/255, green: 134.0/255, blue: 61.0/255, alpha: 1)
    private var titles:[String]?
    var currentPage = 0{
        
        didSet{
            
            if currentPage != oldValue{
                
                self.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
     setCollectionViewLayout(TabLayout.getCollectionViewFlowLayout(), animated: false)
  
    }
    
    init(frame: CGRect,with titles:[String]) {
        
        super.init(frame:frame,collectionViewLayout:TabLayout.getCollectionViewFlowLayout())
             self.registerNib(UINib(nibName: "TabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tabTitleCell")
        
        self.titles = titles
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator  = false
   
    }
    
    private static func getCollectionViewFlowLayout()->UICollectionViewFlowLayout{
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.minimumLineSpacing = 0
        return collectionFlowLayout
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("tabTitleCell", forIndexPath: indexPath) as! TabCollectionViewCell
        cell.textLabel?.text = titles![indexPath.row]
        
        if currentPage == indexPath.row{
            cell.textLabel.textColor = textSelectColor
        }else{
            cell.textLabel.textColor = textNomalColor
        }
       
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        scrolled(indexPath.row)
        tabLayoutDelegate?.showIndex(indexPath.row)
       
    }
    
  
   
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(getTitleWidth(titles![indexPath.row])+10, self.frame.height)
        
    }
    
    // get titleLabel with
    private func getTitleWidth(title:String)->CGFloat{
        
        return NSString(string: title).boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), self.bounds.height), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil).width
    }
  
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titles!.count
    }

    func scroll(page: Int, offset: CGFloat) {
        
    }
    func scrolled(page: Int) {
         let indexPath = NSIndexPath(forRow:page, inSection: 0)
         self.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
         currentPage = page
    
    }

}

protocol TabLayoutDelegate{
    
    func showIndex(index:Int)
}
