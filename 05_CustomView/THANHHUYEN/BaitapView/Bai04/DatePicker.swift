//  DatePicker.swift

import UIKit

protocol DatePickerDelegate: class {
    func dateTime(_ view: DatePicker, needsPerform action: DatePicker.Action)
}

class DatePicker: UIView {
    
    //MARK: - Enum
    enum Action {
        case pickDate(value: String)
    }
    
    //MARK: - IBOutlet
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    
    weak var delegate: DatePickerDelegate?
    var dateValue: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDatePicker()
    }

    func setupDatePicker() {
        Bundle.main.loadNibNamed("DatePicker", owner: self, options: nil)
        pickerView.frame = self.bounds
        pickerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(pickerView)
    }
    func hidePicker() {
        UIView.animate(withDuration: 0.5, animations: {
            self.pickerView.alpha = 0
        }) { (done) in
            if done {
                self.pickerView.isHidden = true
            }
        }
    }

    func showPicker() {
        UIView.animate(withDuration: 0.5, animations: {
            self.pickerView.alpha = 1
        }) { (done) in
            if done {
                self.pickerView.isHidden = false
            }
        }
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        guard let date = dateValue else { return }
        delegate?.dateTime(self, needsPerform: .pickDate(value: date))
    }
    @IBAction func datePickerAtion(_ sender: Any) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        dateValue = dateFormatter.string(from: datePicker.date)
    }
}
