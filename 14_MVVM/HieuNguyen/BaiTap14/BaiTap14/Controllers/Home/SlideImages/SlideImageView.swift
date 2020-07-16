//
//  SlideImageView.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/16/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class SlideImageView: UIView {

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        
    }
}
