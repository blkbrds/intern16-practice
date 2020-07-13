//  Bai02ViewController.swift
//  Drawing

import UIKit

class Bai02ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let pie = Bai02()
        pie.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        pie.center = view.center
        pie.backgroundColor = .white
        view.addSubview(pie)
    }
}
