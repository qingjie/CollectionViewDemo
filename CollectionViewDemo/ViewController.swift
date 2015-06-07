//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by qingjiezhao on 6/7/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController , UICollectionViewDataSource , UICollectionViewDelegate {

    var imagesArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagesArray = ["img1","img2","img3","img4","img5","img6"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var textView = cell.viewWithTag(2) as! UITextView
        
        textView.scrollEnabled = false
        
        var imageView = cell.viewWithTag(1) as! UIImageView
        
        imageView.image = UIImage(named: imagesArray[indexPath.row])
        
        var backBtn = cell.viewWithTag(3) as! UIButton
        
        backBtn.hidden = true
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        cell?.superview?.bringSubviewToFront(cell!)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: nil, animations: ({
            cell?.frame = collectionView.bounds
            
            collectionView.scrollEnabled = false
            
            var backBtn = cell!.viewWithTag(3) as! UIButton
            backBtn.hidden = false
            backBtn.addTarget(self, action: Selector("backBtnAction"), forControlEvents: UIControlEvents.TouchUpInside)
            
            
            var textView = cell!.viewWithTag(2) as! UITextView
            textView.scrollEnabled = true
            
        }), completion: nil)
        
       
    }
    
    func backBtnAction(){
        var indexPath = collectionView?.indexPathsForSelectedItems() as! [NSIndexPath]
        collectionView?.scrollEnabled = true
        collectionView?.reloadItemsAtIndexPaths(indexPath)
        
    }
}

