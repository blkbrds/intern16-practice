//
//  Baitap7.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/2/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai7ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var monkeyTextField: UITextField!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    //MARK: - Private methods
    private func configView() {
        monkeyTextField.isHidden = true
        monkeyTextField.textAlignment = .center
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(singleTapAction))
        singleTap.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTap)
        let doubleTap = UITapGestureRecognizer(target: self, action:#selector(doubleTapAction))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        singleTap.require(toFail: doubleTap)
    }
    
    //MARK: - Private methods
    @objc private func singleTapAction() {
        monkeyTextField.isHidden = false
        monkeyTextField.text = String("Toi la khi")
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            UIView.animate(withDuration: 3) {
            }
        }
    }
    
    @objc private func doubleTapAction() {
        monkeyTextField.isHidden = false
        monkeyTextField.text = "Khi la toi"
        monkeyTextField.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            UIView.animate(withDuration: 3) {
                self.monkeyTextField.alpha = 0
            }
        }
    }
}
