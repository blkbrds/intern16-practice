import UIKit

class BaiTap3ViewController: UIViewController {
    let button = BagdeNumberButton()
    var button1 = BagdeNumberButton()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        button1.frame = CGRect(x: 100, y: 150, width: 150, height: 70)
        button1.isShowBadge = true
        button1.badgeNumber = 100
        button1.layer.cornerRadius = 10
        button1.backgroundColor = .red
        button1.setTitle("Photos", for: .normal)
        button1.editPositionBagde(position: .topRight)
        view.addSubview(button1)
        
        button.frame = CGRect(x: 50, y: 250, width: 150, height: 70)
        button.isShowBadge = true
        button.badgeNumber = 22
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.setTitle("Photos", for: .normal)
        button.editPositionBagde(position: .topLeft)
        view.addSubview(button)
    }
}
