

import UIKit
protocol MienViewControllerDelegate {
    func transfer(_ view: MienViewController, needsPerform acion: MienViewController.Action)
}
final class MienViewController: UIViewController {
   
    @IBOutlet var mienButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavibar()
        setUpButton()
    }
    
    
    @IBAction func mien1Pressed(_ sender: Any) {
    }
    
    private func setUpNavibar() {
        title = "Miền"
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = provinceButton
        
    }
    private func  setUpButton(){
        for i in 0...mienButton.count {
            mienButton[i].layer.borderWidth = 1.0
            mienButton[i].layer.cornerRadius = 10
            mienButton[i].clipsToBounds = true
        }
    }
    
    @objc func doneButtonTouchUpInSide() {
//        let vc = ProvinceViewController()
//        vc.newDomain = domain
//        if let navigationController = navigationController {
//            navigationController.pushViewController(vc, animated: true)
//        }
    }
}
extension MienViewController {
    enum Action {
        case transerMien( tenMien: String)
    }
}
