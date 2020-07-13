//
//  Baitap12ViewController.swift
//  baitap07
//
//  Created by NXH on 7/12/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap12ViewController: UIViewController {
    @IBOutlet weak var largestStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largestStackView.addBackground(color: .black)
    }
}
extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
