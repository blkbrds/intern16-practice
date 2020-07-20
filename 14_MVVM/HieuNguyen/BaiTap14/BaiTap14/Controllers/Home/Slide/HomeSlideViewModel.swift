//
//  HomeSlideViewModel.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/20/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import Foundation
import UIKit

class HomeSlideViewModel {
    private var images: [UIImage] = []
    enum slideChange {
        case previous
        case next
    }
    
    func getData() {
        for item in dummyData2 {
            images.append(item)
        }
    }    
    
    func numberOfImages() -> Int {
        return images.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> SlideCellViewModel? {
        guard indexPath.row < images.count else { return nil}
        let image = images[indexPath.row]
        return SlideCellViewModel(image: image)
    }
    
    func changImage(slideChange: slideChange,collection: UICollectionView,items: Int,pageControll: UIPageControl) {
        let visibleItems: NSArray = collection.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        var a:Int = 0
        switch slideChange {
        case .next:
            a = 1
        case .previous:
            a = -1
        }
        let nextItem: IndexPath = IndexPath(item: currentItem.item + a, section: 0)
        if nextItem.row < items && nextItem.row >= 0{
            collection.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
            pageControll.currentPage = nextItem.row
        }
    }
}

let dummyData2: [UIImage] = [
    UIImage(named: "1")!,
    UIImage(named: "2")!,
    UIImage(named: "3")!,
    UIImage(named: "4")!,
    UIImage(named: "5")!,
    UIImage(named: "6")!,
    UIImage(named: "7")!,
    UIImage(named: "8")!,
    UIImage(named: "9")!,
    UIImage(named: "10")!
]
