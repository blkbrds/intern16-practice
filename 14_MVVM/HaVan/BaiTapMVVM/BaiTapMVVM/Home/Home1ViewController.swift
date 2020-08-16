//
//  HomeViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class Home1ViewController: UIViewController {
     
    // MARK: - IBOutlets
    
    @IBOutlet private weak var downView: UIView!
    // MARK: - Propeties
    private var viewModel = HomeViewModel()
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        //viewModel.getData()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    func configNavigation() {
        title = "HOME"
    }
    
    func configTableView() {
        let nib = Bundle.main.loadNibNamed("HomeTableViewController", owner: self, options: nil)?.first as? HomeTableViewController
        downView.addSubview(nib)
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions

}
