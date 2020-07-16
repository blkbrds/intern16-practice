//
//  BaiTap10ViewController.swift
//  BaiTap BaiTapAutoLAyout
//
//  Created by MacBook Pro on 7/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap10ViewController: UIViewController {
    
    // MARK: - IBOulet properties
    @IBOutlet weak var oneUIView: UIView!
    @IBOutlet weak var twoUIView: UIView!
    @IBOutlet weak var threetUIView: UIView!
    @IBOutlet weak var fourUIView: UIView!
    @IBOutlet weak var heightTwoContraint: NSLayoutConstraint!
    @IBOutlet weak var heightOneContraint: NSLayoutConstraint!
    @IBOutlet weak var heightThreeContraint: NSLayoutConstraint!
    @IBOutlet weak var heigtFourContrain: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUiView()
    }
    // MARK: - Private Function
    private func setUpUiView(){
        let oneUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOneUIView))
        let twoUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapTwoUIView))
        let threeUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapThreeUIView))
        let fourUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapFourUIView))
        oneUIView.addGestureRecognizer(oneUIViewTapGesture)
        twoUIView.addGestureRecognizer(twoUIViewTapGesture)
        threetUIView.addGestureRecognizer(threeUIViewTapGesture)
        fourUIView.addGestureRecognizer(fourUIViewTapGesture)
    }
    @objc func handleTapOneUIView() {
        self.heightOneContraint.constant = 150
        self.heightTwoContraint.constant = 75
        self.heightThreeContraint.constant = 75
        self.heigtFourContrain.constant = 75
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    @objc func handleTapTwoUIView() {
        self.heightOneContraint.constant = 75
        self.heightTwoContraint.constant = 150
        self.heightThreeContraint.constant = 75
        self.heigtFourContrain.constant = 75
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    @objc func handleTapThreeUIView() {
        self.heightOneContraint.constant = 75
        self.heightTwoContraint.constant = 75
        self.heightThreeContraint.constant = 150
        self.heigtFourContrain.constant = 75
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    @objc func handleTapFourUIView() {
        self.heightOneContraint.constant = 75
        self.heightTwoContraint.constant = 75
        self.heightThreeContraint.constant = 75
        self.heigtFourContrain.constant = 150
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
}
