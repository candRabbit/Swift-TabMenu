//
//  TabLayout.swift
//  TabMenu
//
//  Created by lvlinqing on 15/11/26.
//  Copyright © 2015年 lvlinqing. All rights reserved.
//

import UIKit

class TabLayout: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ViewPagerDelegate{

    var tabDelegate:TabDelegate?
    var textNomalColor = UIColor.grayColor()
    var textSelectColor = getColor(36, green: 206, blue: 252)
    
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
        self.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
   
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
            cell.textLabel.font = UIFont.systemFontOfSize(16)
        }else{
            cell.textLabel.textColor = textNomalColor

            cell.textLabel.font = UIFont.systemFontOfSize(14)

        }
       
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
       // scrolled(indexPath.row)
        tabDelegate?.showIndex(indexPath.row)
       
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


