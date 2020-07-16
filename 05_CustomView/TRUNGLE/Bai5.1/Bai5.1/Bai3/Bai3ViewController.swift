
import UIKit

class Bai3ViewController : UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    // MARK: - Function
    func setUpView(){
        view.backgroundColor = .white
        let button = Bai3()
        button.frame = CGRect(x: 140, y: 100, width: 150, height: 70)
        button.backgroundColor = .green
        button.text = "700"
        button.numberBagdePosition = .topRight
        button.layer.cornerRadius = 10
        button.setTitle("Email", for: .normal)
        view.addSubview(button)
        
        let button2 = Bai3()
        button2.frame = CGRect(x: 140, y: 200, width: 150, height: 70)
        button2.backgroundColor = .red
        button2.text = "700"
        button2.numberBagdePosition = .topLeft
        button2.layer.cornerRadius = 10
        button2.setTitle("Photo", for: .normal)
        view.addSubview(button2)
        
        let button3 = Bai3()
        button3.frame = CGRect(x: 140, y: 300, width: 150, height: 70)
        button3.backgroundColor = .systemBlue
        button3.text = "20"
        button3.numberBagdePosition = .topCenter
        button3.layer.cornerRadius = 10
        button3.setTitle("Camera", for: .normal)
        view.addSubview(button3)
    }
}
