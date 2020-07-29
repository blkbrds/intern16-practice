import UIKit

final class Bai01ViewController: UIViewController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Function
    private func configUI(){
        view.backgroundColor = .white
        let colunmChart = Bai01View(frame: CGRect(x: 40, y: 150, width: view.bounds.width - 80, height: 250))
               colunmChart.values = [Value(valueCGFloat: 10, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),
                             Value(valueCGFloat: 150, color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
                             Value(valueCGFloat: 300, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)),
                             Value(valueCGFloat: 50, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)),
                             Value(valueCGFloat: 150, color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
                             Value(valueCGFloat: 450, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),
                             Value(valueCGFloat: 100, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]
               view.addSubview(colunmChart)
    }
}
