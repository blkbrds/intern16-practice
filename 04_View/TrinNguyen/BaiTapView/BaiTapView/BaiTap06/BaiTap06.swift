//
//  BaiTap06.swift
//  BaiTapView
//
//  Created by PCI0004 on 7/2/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap06: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var monkeyImageView: UIImageView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private Methods
    private func configTextField() {
        let scaleMax: CGFloat = 2.0
        let scaleMin: CGFloat = 0.5
        var imageScale: CGFloat = 1.0
    }

    // MARK: - IBActions
    @IBAction private func handlePinch(recognizer: UIPinchGestureRecognizer) {
        guard recognizer.view != nil else { return }
        if recognizer.state == .began || recognizer.state == .changed {
            if recognizer.scale < scaleMax && recognizer.scale > scaleMin {
                monkeyImageView.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            }
        }
    }

    @IBAction private func handleRotate(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }

    }

    @IBAction private func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)// gan view vao translation
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }// if view bang cai recognizer thi gan diem view bang diem o giua cong voi diem point
        recognizer.setTranslation(CGPoint.zero, in: view)
        // gan recognizer lai bang 0
    }

    @IBAction private func longPressGestureHandler(recognizer: UILongPressGestureRecognizer) {
        monkeyImageView.transform = CGAffineTransform.identity
    }
}
