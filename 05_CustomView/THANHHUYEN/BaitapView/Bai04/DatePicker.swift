//  DatePicker.swift

import UIKit

protocol DatePickerDelegate: class {
    func dateTime(_ view: DatePicker, needsPerform action: DatePicker.Action)
}

final class DatePicker: UIView {
    
    //MARK: - Enum
    enum Action {
        case pickDate(value: String)
    }
    
    //MARK: - IBOutlet
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var pickerView: UIView!
    @IBOutlet private weak var doneButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: DatePickerDelegate?
    private var dateValue: String?
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDatePicker()
    }
    
    //MARK: - Function
    private func setupDatePicker() {
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
    
    //MARK: - IBAction
    @IBAction private func doneButtonAction(_ sender: Any) {
        guard let date = dateValue else { return }
        delegate?.dateTime(self, needsPerform: .pickDate(value: date))
    }
    
    @IBAction private func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateValue = dateFormatter.string(from: datePicker.date)
    }
}
