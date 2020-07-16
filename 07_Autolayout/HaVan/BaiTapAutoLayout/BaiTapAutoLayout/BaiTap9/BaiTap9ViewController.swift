//
//  BaiTap9ViewController.swift
//  BaiTapAutoLayout
//
//  Created by NganHa on 7/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaiTap9ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var commentButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet weak var horizontalScrollView: UIScrollView!
    @IBOutlet weak var contentLabel: UILabel!
    // MARK: - Properties
    private var temp: Int = 0
    private var informationArray = [Information]()
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
        configInformation()
        updateView()
    }
    // MARK: - Private functions
    private func configButton() {
        likeButton.layer.cornerRadius = 10
        commentButton.layer.cornerRadius = 10
        shareButton.layer.cornerRadius = 10
    }
    
    private func configInformation() {
       let array: InformationCreation = InformationCreation()
        informationArray = array.create()
    }
    
    private func updateView() {
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseIn, animations: {
                self.horizontalScrollView.setContentOffset(CGPoint(x: CGFloat(self.temp) * self.horizontalScrollView.bounds.width, y: 0), animated: true)
            }, completion: nil)
        numberLabel.text = "\(temp + 1)/5"
        contentLabel.text = informationArray[temp].content
    }
    
    // MARK: - IBActions
    @IBAction func preciousButtonTouchUpInSide(_ sender: UIButton) {
        if temp == 0 {
            return
        }
        temp -= 1
        updateView()
    }

    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        if temp == 4 {
            temp = 0
        } else {
            temp += 1
        }
           updateView()
        }
    }
