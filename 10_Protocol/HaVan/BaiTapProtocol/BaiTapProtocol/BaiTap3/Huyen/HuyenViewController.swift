//
//  HuyenViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol HuyenViewControllerDelegate: class {
    func controller(_ controller: HuyenViewController, needsPerform action: HuyenViewController.Action)
}

final class HuyenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var huyen1Button: UIButton!
    @IBOutlet private weak var huyen2Button: UIButton!
    @IBOutlet private weak var huyen3Button: UIButton!
    @IBOutlet private weak var huyen4Button: UIButton!
    @IBOutlet private weak var huyen5Button: UIButton!
    @IBOutlet private weak var huyen6Button: UIButton!
    @IBOutlet private weak var huyen7Button: UIButton!
    @IBOutlet private weak var huyen8Button: UIButton!
    @IBOutlet private weak var huyen9Button: UIButton!
    @IBOutlet private weak var huyen10Button: UIButton!
    
    // MARK: - Propeties
    private var tenHuyen: String = ""
    weak var delegate: HuyenViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configButton()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Huyện"
        let rightBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToDiaDiem))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func configButton() {
        initButton(button: huyen1Button)
        initButton(button: huyen2Button)
        initButton(button: huyen3Button)
        initButton(button: huyen4Button)
        initButton(button: huyen5Button)
        initButton(button: huyen6Button)
        initButton(button: huyen7Button)
        initButton(button: huyen8Button)
        initButton(button: huyen9Button)
        initButton(button: huyen10Button)
    }
    
    private func initButton(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(srgbRed: 0.9, green: 0.1, blue: 0, alpha: 1)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
    }
    
    private func changeButtonState(button: UIButton) {
        button.backgroundColor = .init(red: 0.9, green: 0.1, blue: 0, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        guard let title = button.currentTitle else { return }
        tenHuyen = title
    }
    
    private func setUAllButtonState(button: UIButton) {
        huyen1Button.backgroundColor = .clear
        huyen1Button.setTitleColor(.black, for: .normal)
        huyen2Button.backgroundColor = .clear
        huyen2Button.setTitleColor(.black, for: .normal)
        huyen3Button.backgroundColor = .clear
        huyen3Button.setTitleColor(.black, for: .normal)
        huyen4Button.backgroundColor = .clear
        huyen4Button.setTitleColor(.black, for: .normal)
        huyen5Button.backgroundColor = .clear
        huyen5Button.setTitleColor(.black, for: .normal)
        huyen6Button.backgroundColor = .clear
        huyen6Button.setTitleColor(.black, for: .normal)
        huyen7Button.backgroundColor = .clear
        huyen7Button.setTitleColor(.black, for: .normal)
        huyen8Button.backgroundColor = .clear
        huyen8Button.setTitleColor(.black, for: .normal)
        huyen9Button.backgroundColor = .clear
        huyen9Button.setTitleColor(.black, for: .normal)
        huyen10Button.backgroundColor = .clear
        huyen10Button.setTitleColor(.black, for: .normal)
        changeButtonState(button: button)
    }
    // MARK: - Objc functions
    @objc private func backToDiaDiem() {
        delegate?.controller(self, needsPerform: .saveHuyen(tenHuyen: tenHuyen))
        navigationController?.popToRootViewController(animated: true) 
    }
    
    // MARK: - IBActions
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        setUAllButtonState(button: sender)
    }
}

// MARK: - Extension
extension HuyenViewController {
    enum Action {
        case saveHuyen(tenHuyen: String)
    }
}
