import UIKit

class Bai04ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var dateTextField: UITextField!
    
    // MARK: - Properties
    let datePicker = UIDatePicker()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
    }
    
    // MARK: - Func
    func  setDatePicker() {
        //style textfield
        dateTextField.textAlignment = .center
        
        //add toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonSelected))
        toolbar.setItems([doneButton], animated: true)
        
        //set toolbar
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
        
        //format picker
        datePicker.datePickerMode = .date
    }
    
    // MARK: - objc
    @objc func doneButtonSelected() {
        //format textfield
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        
        dateTextField.text = formater.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
