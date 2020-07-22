//
//  HomeDetailViewController.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/21/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class HomeDetailViewController: UIViewController {

    @IBOutlet private weak var slideView: UIView!
    
    var viewModel: HomeDetailViewModel? {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlideView()        
    }
    
    private func setupSlideView() {
        let headerView = Bundle.main.loadNibNamed("HomeSlideView", owner: self, options: nil)?[0] as! HomeSlideView
        slideView.addSubview(headerView)
        headerView.frame = slideView.bounds
    }
    
    private func updateUI() {
        title = viewModel?.coffeeShop?.name
    }
}
