//  Bai02ViewController.swift
//  Drawing

import UIKit

final class Bai02ViewController: UIViewController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Function
    private func configUI() {
        view.backgroundColor = .white
        let pie = Bai02()
        pie.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        pie.center = view.center
        pie.backgroundColor = .white
        view.addSubview(pie)
    }
}
