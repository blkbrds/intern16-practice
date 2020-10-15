//
//  MienViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/13/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol MienViewControllerDelegate: class {
    func controller(_ view: MienViewController, needsPerform action: MienViewController.Action)
}

class MienViewController: UIViewController {

    @IBOutlet weak var mien1Button: UIButton!
    @IBOutlet weak var mien2Button: UIButton!
    @IBOutlet weak var mien3Button: UIButton!
    @IBOutlet weak var mien4Button: UIButton!
    @IBOutlet weak var mien5Button: UIButton!
    @IBOutlet weak var mien6Button: UIButton!
    @IBOutlet weak var mien7Button: UIButton!
    @IBOutlet weak var mien8Button: UIButton!
    @IBOutlet weak var mien9Button: UIButton!
    @IBOutlet weak var mien10Button: UIButton!

    var tagArray: [Int] = []

    var selectedTag: Int = 0
    var willSelectTag: Int = 0
    weak var delegate: MienViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Miền"
        let tinhButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(goToTinh))
        navigationItem.rightBarButtonItem = tinhButton
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        selectedTag = tagArray[0]
        defaultSelected(tag: selectedTag)

    }

    @objc func goToTinh() {
        let tinhViewController = TinhViewController()
        tinhViewController.tagArray = tagArray
        tinhViewController.delegate = self
        navigationController?.pushViewController(tinhViewController, animated: true)
    }

    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        let selectedButton = self.view.viewWithTag(selectedTag) as? UIButton
        selectedButton?.changeButtonState(isSelected: false, color: .white)
        let tag = sender.tag
        selectedTag = tag
        willSelectTag = tag
        sender.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    }

    func defaultSelected(tag: Int) {
        let selectedButton = self.view.viewWithTag(tag) as? UIButton
        selectedButton?.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    }
}

extension MienViewController {
    enum Action {
        case saveAll(mienTag: Int, tinhTag: Int, huyenTag: Int)
    }
}

extension MienViewController: TinhViewControllerDelegate {
    func controller(_ view: TinhViewController, needsPerform action: TinhViewController.Action) {
        switch action {
        case .saveHuyenVaTinh(tinhTag: let tinhTag, huyenTag: let huyenTag):
            delegate?.controller(self, needsPerform: .saveAll(mienTag: selectedTag, tinhTag: tinhTag, huyenTag: huyenTag))
        }
    }
}

