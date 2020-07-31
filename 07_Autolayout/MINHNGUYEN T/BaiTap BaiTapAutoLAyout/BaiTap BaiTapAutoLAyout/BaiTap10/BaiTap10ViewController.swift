//
//  BaiTap10ViewController.swift
//  BaiTap BaiTapAutoLAyout
//
//  Created by MacBook Pro on 7/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap10ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var oneUIView: UIView!
    @IBOutlet private weak var twoUIView: UIView!
    @IBOutlet private weak var threetUIView: UIView!
    @IBOutlet private weak var fourUIView: UIView!
    @IBOutlet private weak var twoHeightContraint: NSLayoutConstraint!
    @IBOutlet private weak var oneHeightContraint: NSLayoutConstraint!
    @IBOutlet private weak var threeHeightContraint: NSLayoutConstraint!
    @IBOutlet private weak var fourHeightContrain: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUiView()
    }
    
    // MARK: - Private functions
    private func setupUiView(){
        let oneUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOneUIView))
        let twoUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapTwoUIView))
        let threeUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapThreeUIView))
        let fourUIViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapFourUIView))
        oneUIView.addGestureRecognizer(oneUIViewTapGesture)
        twoUIView.addGestureRecognizer(twoUIViewTapGesture)
        threetUIView.addGestureRecognizer(threeUIViewTapGesture)
        fourUIView.addGestureRecognizer(fourUIViewTapGesture)
    }
    
    // MARK: Objc functions
    @objc private func handleTapOneUIView() {
        oneHeightContraint.constant = 150
        twoHeightContraint.constant = 75
        threeHeightContraint.constant = 75
        fourHeightContrain.constant = 75
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    
    @objc private func handleTapTwoUIView() {
        oneHeightContraint.constant = 75
        twoHeightContraint.constant = 150
        threeHeightContraint.constant = 75
        fourHeightContrain.constant = 75
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    
    @objc private func handleTapThreeUIView() {
        oneHeightContraint.constant = 75
        twoHeightContraint.constant = 75
        threeHeightContraint.constant = 150
        fourHeightContrain.constant = 75
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    
    @objc private func handleTapFourUIView() {
        oneHeightContraint.constant = 75
        twoHeightContraint.constant = 75
        threeHeightContraint.constant = 75
        fourHeightContrain.constant = 150
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
}
