//
//  DiaDiemViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/13/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit


class DiaDiemViewController: UIViewController {

    var tagArray: [Int] = [1, 1, 1]

    @IBOutlet weak var mienDetailLabel: UILabel!
    @IBOutlet weak var tinhDetailLabel: UILabel!
    @IBOutlet weak var huyenDetailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Địa Điểm"

        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        setUpDefault()
    }

    @objc func editAction() {
        let mienViewController = MienViewController()
        mienViewController.tagArray = tagArray
        mienViewController.delegate = self
        navigationController?.pushViewController(mienViewController, animated: true)
    }

    func setUpDefault() {
        let data = ConfigData()
        mienDetailLabel.text = data.getMien(tag: tagArray[0])
        tinhDetailLabel.text = data.getTinh(tag: tagArray[1])
        huyenDetailLabel.text = data.getHuyen(tag: tagArray[2])
    }

    func updateData(mien: Int, tinh: Int, huyen: Int) {
        tagArray[0] = mien
        tagArray[1] = tinh
        tagArray[2] = huyen
        setUpDefault()
    }
}

extension DiaDiemViewController: MienViewControllerDelegate {
    func controller(_ view: MienViewController, needsPerform action: MienViewController.Action) {
        switch action {
        case .saveAll(mienTag: let mienTag, tinhTag: let tinhTag, huyenTag: let huyenTag):
            print(mienTag)
            updateData(mien: mienTag, tinh: tinhTag, huyen: huyenTag)
        }
    }
}

