//
//  TinhViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/13/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol TinhViewControllerDelegate: class {
    func controller(_ view: TinhViewController, needsPerform action: TinhViewController.Action )
}

class TinhViewController: UIViewController {
    
    var tagArray : [Int] = []
    var selectedTag: Int = 0
    var willSelectTag: Int = 0
    weak var delegate: TinhViewControllerDelegate?
    
    @IBOutlet weak var tinh1Button: UIButton!
    @IBOutlet weak var tinh2Button: UIButton!
    @IBOutlet weak var tinh3Button: UIButton!
    @IBOutlet weak var tinh4Button: UIButton!
    @IBOutlet weak var tinh5Button: UIButton!
    @IBOutlet weak var tinh6Button: UIButton!
    @IBOutlet weak var tinh7Button: UIButton!
    @IBOutlet weak var tinh8Button: UIButton!
    @IBOutlet weak var tinh9Button: UIButton!
    @IBOutlet weak var tinh10Button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tỉnh"

        let tinhButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(goToHuyen))
        navigationItem.rightBarButtonItem = tinhButton
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        selectedTag = tagArray[1]
        defaultSelected(tag: selectedTag)
    }

    @objc func goToHuyen() {
        let huyenViewController = HuyenViewController()
        huyenViewController.tagArray = tagArray
        huyenViewController.delegate = self
        navigationController?.pushViewController(huyenViewController, animated: true)
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        let selectedButton = self.view.viewWithTag(selectedTag) as? UIButton
        selectedButton?.changeButtonState(isSelected: false, color: .white)
        let tag = sender.tag
        selectedTag = tag
        willSelectTag = tag
        sender.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
    }
    
    func defaultSelected(tag: Int) {
        let selectedButton = self.view.viewWithTag(tag) as? UIButton
        selectedButton?.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
    }
}

extension TinhViewController {
    enum Action {
        case saveHuyenVaTinh(tinhTag: Int, huyenTag: Int)
    }
}

extension TinhViewController: HuyenViewControllerDelegate {
    func controller(_ view: HuyenViewController, needsPerform action: HuyenViewController.Action) {
        switch action {
        case .saveHuyen(huyenTag: let huyenTag):
            delegate?.controller(self, needsPerform: .saveHuyenVaTinh(tinhTag: selectedTag, huyenTag: huyenTag))
        }
    }
}

    




