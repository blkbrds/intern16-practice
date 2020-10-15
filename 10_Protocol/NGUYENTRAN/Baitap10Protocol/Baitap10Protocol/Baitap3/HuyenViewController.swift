//
//  HuyenViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/13/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol HuyenViewControllerDelegate: class {
    func controller(_ view: HuyenViewController, needsPerform action: HuyenViewController.Action)
}

class HuyenViewController: UIViewController {

    var tagArray: [Int] = []
    var selectedTag: Int = 0
    var willSelectTag: Int = 0
    weak var delegate: HuyenViewControllerDelegate?

    @IBOutlet weak var huyen1Button: UIButton!
    @IBOutlet weak var huyen2Button: UIButton!
    @IBOutlet weak var huyen3Button: UIButton!
    @IBOutlet weak var huyen4Button: UIButton!
    @IBOutlet weak var huyen5Button: UIButton!
    @IBOutlet weak var huyen6Button: UIButton!
    @IBOutlet weak var huyen7Button: UIButton!
    @IBOutlet weak var huyen8Button: UIButton!
    @IBOutlet weak var huyen9Button: UIButton!
    @IBOutlet weak var huyen10Button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Huyện"

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        selectedTag = tagArray[2]
        defaultSelected(tag: selectedTag)
    }

    @objc func doneAction() {
        delegate?.controller(self, needsPerform: .saveHuyen(huyenTag: selectedTag))
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        let selectedButton = self.view.viewWithTag(selectedTag) as? UIButton
        selectedButton?.changeButtonState(isSelected: false, color: .white)
        let tag = sender.tag
        selectedTag = tag
        willSelectTag = tag
        sender.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
    }

    func defaultSelected(tag: Int) {
        let selectedButton = self.view.viewWithTag(tag) as? UIButton
        selectedButton?.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
    }
}

extension HuyenViewController {
    enum Action {
        case saveHuyen(huyenTag: Int)
    }
}
