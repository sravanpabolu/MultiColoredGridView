//
//  CollectionViewController.swift
//  GridDemo
//
//  Created by Sravan on 01/05/17.
//  Copyright © 2017 Sravan. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    let reuseIdentifier = "Cell"
    static var rowCount = Int()
    static var columnCount = Int()
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    var rows = rowCount
    var column = columnCount
}

//MARK: Data source
extension CollectionViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return rows
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return column
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
        cell.backgroundColor = .randomColor()
        // Configure the cell
        return cell
    }
}

//MARK: Flow Layout Delegate
extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * CGFloat(rows + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(rows)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


//MARK: Other extensions
extension CGFloat {
    static func randomNumber() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red:   .randomNumber(),
                       green: .randomNumber(),
                       blue:  .randomNumber(),
                       alpha: 1.0)
    }
}

