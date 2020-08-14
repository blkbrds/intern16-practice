//
//  TinhViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol TinhViewControllerDelegate: class {
    func controller(_ controller: TinhViewController, needsPerform action: TinhViewController.Action)
}

final class TinhViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tinh1Button: UIButton!
    @IBOutlet private weak var tinh2Button: UIButton!
    @IBOutlet private weak var tinh3Button: UIButton!
    @IBOutlet private weak var tinh4Button: UIButton!
    @IBOutlet private weak var tinh5Button: UIButton!
    @IBOutlet private weak var tinh6Button: UIButton!
    @IBOutlet private weak var tinh7Button: UIButton!
    @IBOutlet private weak var tinh8Button: UIButton!
    @IBOutlet private weak var tinh9Button: UIButton!
    @IBOutlet private weak var tinh10Button: UIButton!
    
    // MARK: - Propeties
    private var tenTinh: String = ""
    private var tenHuyen = ""
    weak var delegate: TinhViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configButtons()
    }
    
    // MARK: - Override functions
    override func configButtons() {
        configButton(button: tinh1Button)
        configButton(button: tinh2Button)
        configButton(button: tinh3Button)
        configButton(button: tinh4Button)
        configButton(button: tinh5Button)
        configButton(button: tinh6Button)
        configButton(button: tinh7Button)
        configButton(button: tinh8Button)
        configButton(button: tinh9Button)
        configButton(button: tinh10Button)
    }
    
    override func changeButtonState(button: UIButton) {
        super.changeButtonState(button: button)
        button.backgroundColor = .init(red: 0, green: 0.8, blue: 0.2, alpha: 1)
        guard let title = button.currentTitle else { return }
        tenTinh = title
    }
    
    override func configButton(button: UIButton) {
        super.configButton(button: button)
        button.layer.borderColor = .init(srgbRed: 0, green: 0.8, blue: 0.2, alpha: 1)
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Tỉnh"
        let rightBarButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(turnToTinhViewController))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setUAllButtonState(button: UIButton) {
        tinh1Button.backgroundColor = .clear
        tinh1Button.setTitleColor(.black, for: .normal)
        tinh2Button.backgroundColor = .clear
        tinh2Button.setTitleColor(.black, for: .normal)
        tinh3Button.backgroundColor = .clear
        tinh3Button.setTitleColor(.black, for: .normal)
        tinh4Button.backgroundColor = .clear
        tinh4Button.setTitleColor(.black, for: .normal)
        tinh5Button.backgroundColor = .clear
        tinh5Button.setTitleColor(.black, for: .normal)
        tinh6Button.backgroundColor = .clear
        tinh6Button.setTitleColor(.black, for: .normal)
        tinh7Button.backgroundColor = .clear
        tinh7Button.setTitleColor(.black, for: .normal)
        tinh8Button.backgroundColor = .clear
        tinh8Button.setTitleColor(.black, for: .normal)
        tinh9Button.backgroundColor = .clear
        tinh9Button.setTitleColor(.black, for: .normal)
        tinh10Button.backgroundColor = .clear
        tinh10Button.setTitleColor(.black, for: .normal)
        changeButtonState(button: button)
    }
    
    // MARK: - Objc functions
    @objc private func turnToTinhViewController() {
        let huyenVC = HuyenViewController()
        huyenVC.delegate = self
        navigationController?.pushViewController(huyenVC, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        setUAllButtonState(button: sender)
    }
}

// MARK: - Extension
extension TinhViewController {
    enum Action {
        case saveHuyenAndTinh(tenTinh: String, tenHuyen: String)
    }
}

// MARK: - HuyenViewControllerDelegate
extension TinhViewController: HuyenViewControllerDelegate {
    
    func controller(_ controller: HuyenViewController, needsPerform action: HuyenViewController.Action) {
        switch action {
        case .saveHuyen(tenHuyen: let huyen):
            delegate?.controller(self, needsPerform: .saveHuyenAndTinh(tenTinh: tenTinh, tenHuyen: huyen))
        }
    }
}
