//  Bai03ViewController.swift

import UIKit

final class Bai03ViewController: UIViewController {

    let button1 = BagdeNumber()
    let button2 = BagdeNumber()
    let button3 = BagdeNumber()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Func private
    private func setupView(){
        view.backgroundColor = .white
        
        button1.frame = CGRect(x: 140, y: 100, width: 150, height: 70)
        button1.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button1.text = "123+"
        button1.numberBagdePosition = .topRight
        button1.layer.cornerRadius = 10
        button1.setTitle("Email", for: .normal)
        view.addSubview(button1)
        
        button2.frame = CGRect(x: 140, y: 200, width: 150, height: 70)
        button2.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button2.text = "90"
        button2.numberBagdePosition = .topCenter
        button2.layer.cornerRadius = 10
        button2.setTitle("Phone Number", for: .normal)
        view.addSubview(button2)
        
        button3.frame = CGRect(x: 140, y: 300, width: 150, height: 70)
        button3.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        button3.text = "10"
        button3.numberBagdePosition = .topLeft
        button3.layer.cornerRadius = 10
        button3.setTitle("Messager", for: .normal)
        view.addSubview(button3)
    }
}
