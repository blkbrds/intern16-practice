//
//  MienViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol MienViewControllerDelegate: class {
    func controller(_ view: MienViewController, needsPerform action: MienViewController.Action)
}

final class MienViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var mien1Button: UIButton!
    @IBOutlet private weak var mien10Button: UIButton!
    @IBOutlet private weak var mien9Button: UIButton!
    @IBOutlet private weak var mien8Button: UIButton!
    @IBOutlet private weak var mien7Button: UIButton!
    @IBOutlet private weak var mien6Button: UIButton!
    @IBOutlet private weak var mien5Button: UIButton!
    @IBOutlet private weak var mien4Button: UIButton!
    @IBOutlet private weak var mien3Button: UIButton!
    @IBOutlet private weak var mien2Button: UIButton!
    
    // MARK: - Propeties
    private var tenMien: String = ""
    private var tenTinh: String = ""
    private var tenHuyen: String = ""
    weak var delegate: MienViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configButtons()
    }
    
    // MARK: - Override functions
    override func configButtons() {
        configButton(button: mien1Button)
        configButton(button: mien2Button)
        configButton(button: mien3Button)
        configButton(button: mien4Button)
        configButton(button: mien5Button)
        configButton(button: mien6Button)
        configButton(button: mien7Button)
        configButton(button: mien8Button)
        configButton(button: mien9Button)
        configButton(button: mien10Button)
    }
    
    override func configButton(button: UIButton) {
        super.configButton(button: button)
        button.layer.borderColor = .init(srgbRed: 0, green: 0.2, blue: 1.0, alpha: 1)
    }
    
    override func changeButtonState(button: UIButton) {
        super.changeButtonState(button: button)
        button.backgroundColor = .init(red: 0, green: 0.2, blue: 1.0, alpha: 1)
        guard let title = button.currentTitle else { return }
        tenMien = title
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Miền"
        let rightBarButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(turnToTinhViewController))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setUAllButtonState(button: UIButton) {
        mien1Button.backgroundColor = .clear
        mien1Button.setTitleColor(.black, for: .normal)
        mien2Button.backgroundColor = .clear
        mien2Button.setTitleColor(.black, for: .normal)
        mien3Button.backgroundColor = .clear
        mien3Button.setTitleColor(.black, for: .normal)
        mien4Button.backgroundColor = .clear
        mien4Button.setTitleColor(.black, for: .normal)
        mien5Button.backgroundColor = .clear
        mien5Button.setTitleColor(.black, for: .normal)
        mien6Button.backgroundColor = .clear
        mien6Button.setTitleColor(.black, for: .normal)
        mien7Button.backgroundColor = .clear
        mien7Button.setTitleColor(.black, for: .normal)
        mien8Button.backgroundColor = .clear
        mien8Button.setTitleColor(.black, for: .normal)
        mien9Button.backgroundColor = .clear
        mien9Button.setTitleColor(.black, for: .normal)
        mien10Button.backgroundColor = .clear
        mien10Button.setTitleColor(.black, for: .normal)
        changeButtonState(button: button)
    }
    
    // MARK: - Objc functions
    @objc private func turnToTinhViewController() {
        let tinhVC = TinhViewController()
        tinhVC.delegate = self
        navigationController?.pushViewController(tinhVC, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        setUAllButtonState(button: sender)
    }
}

// MARK: - Extension
extension MienViewController {
    enum Action {
        case saveMienAndTinhAndHuyen(tenMien: String, tenTinh: String, tenHuyen: String)
    }
}

// MARK: - TinhViewControllerDelegate
extension MienViewController: TinhViewControllerDelegate {
    
    func controller(_ controller: TinhViewController, needsPerform action: TinhViewController.Action) {
        switch action {
        case .saveHuyenAndTinh(tenTinh: let tinh, tenHuyen: let huyen):
            delegate?.controller(self, needsPerform: .saveMienAndTinhAndHuyen(tenMien: tenMien, tenTinh: tinh, tenHuyen: huyen))
        }
    }
}
