import UIKit

class Bai04ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var dateTextField: UITextField!

    // MARK: - Properties
    var datePicker: DatePicker!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
    }

    // MARK: - Func
    func setDatePicker() {
        dateTextField.delegate = self
        datePicker.delegate = self
    }
}
// MARK: - extension
extension Bai04ViewController: UITextFieldDelegate {
    func dateTime(_ view: DatePicker, needsPerform: DatePicker.Action) {
        datePicker.showPicker()
    }


    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.5) {
            self.datePicker.alpha = 1
        }
        return false
    }
}

extension Bai04ViewController: DatePickerDelegate {
    func sendDateValue(view: DatePicker, needsPerform action: DatePicker.Action) {
        switch action {
        case .pickDate(let date):
            dateTextField.text = date
            view.hidePicker()
        }
    }
}
