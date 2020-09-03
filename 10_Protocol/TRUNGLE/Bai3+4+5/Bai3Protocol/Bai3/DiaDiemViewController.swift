//
//  DiaDiemViewController.swift
//  Bai3Protocol
//
//  Created by Trung Le D. on 7/24/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
protocol DiaDiemViewControllerDelegate {
    func getMien() -> String
    func getTinh() -> String
    func getHuyen() -> String
}
class DiaDiemViewController: UIViewController {
    
    //MARK: - Properties
    var delegate : DiaDiemViewControllerDelegate?
    
    //MARK: - IBOutlet
    @IBOutlet weak var MienTextField: UITextField!
    @IBOutlet weak var tinh1TextField: UITextField!
    @IBOutlet weak var HuyenTextField: UITextField!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa Điểm"
        configNaviBar()
    }
    
    //MARK: - Function
    func configNaviBar() {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonUpSide))
        navigationItem.rightBarButtonItem = editButton
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpUI()
    }
    func setUpUI() {
        guard let huyenText = delegate?.getHuyen(), let tinhText = delegate?.getTinh(), let mienText = delegate?.getMien() else { return }
        MienTextField.text = mienText
        tinh1TextField.text = tinhText
        HuyenTextField.text = huyenText
    }
    
    @objc func editButtonUpSide() {
            let vc = MienViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
