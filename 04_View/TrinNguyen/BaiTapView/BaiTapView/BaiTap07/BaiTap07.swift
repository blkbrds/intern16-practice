//
//  BaiTap07.swift
//  BaiTapView
//
//  Created by PCI0004 on 7/3/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap07: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var monkeyImageView: UIImageView!
    @IBOutlet private weak var chatImageView: UIImageView!
    @IBOutlet private weak var messLabel: UILabel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configScreen()
        tapDisplayMess()
    }
    private func configScreen() {
        chatImageView.isHidden = true
        messLabel.isHidden = true
    }
    
    // MARK: - Private Methods
    private func tapDisplayMess() {
        monkeyImageView.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        tap.numberOfTapsRequired = 1
        monkeyImageView.addGestureRecognizer(tap)

        let doubletap = UITapGestureRecognizer(target: self, action: #selector(doubletappedView))
        doubletap.numberOfTapsRequired = 2
        monkeyImageView.addGestureRecognizer(doubletap)
        tap.require(toFail: doubletap)
    }
    
    @objc private func tappedView() {
        chatImageView.isHidden = false
        messLabel.isHidden = false
        messLabel.text = "Tôi là khỉ"
        messLabel.alpha = 1
        chatImageView.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            UIView.animate(withDuration: 1) {
                self.chatImageView.alpha = 0
                self.messLabel.alpha = 0
            }
        }
    }

    @objc private func doubletappedView() {
        chatImageView.isHidden = false
        messLabel.isHidden = false
        messLabel.text = "Khỉ là tôi"
        chatImageView.alpha = 1
        messLabel.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            UIView.animate(withDuration: 1) {
                self.chatImageView.alpha = 0
                self.messLabel.alpha = 0
            }
        }
    }
}
