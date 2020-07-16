//  CustomPickerView.swift
//  Bai5.1
//  Created by Abcd on 7/7/20.
//  Copyright © 2020 Trungld. All rights reserved.
//
import UIKit
protocol CustomePickerViewDelegate {
    func selectDate (datePicker: CustomPickerView,needsPerformAction action: CustomPickerView.Action, selectDate: Date?)
}
class CustomPickerView: UIView {
    // MARK: - Enum
    enum Action {
        case hide
        case show
        case done
        case cancel
    }
    // MARK: - Properties
    var delegate: CustomePickerViewDelegate?
    // MARK: - Outlet
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var datePickerView: UIDatePicker!
    // MARK: - Function
    func config() {
        backgroundView.alpha = 1
        contentView.alpha = 1
        isHidden = true
    }
    func hide(animation: Bool) {
        if animation {
            UIView.animate(withDuration: 0.5, animations: { self.backgroundView.alpha = 0.5
                self.contentView.alpha = 0.5 })
            { (done) in self.hide(animation: true)
                
            }
        } else {
            backgroundView.alpha = 0.5
            contentView.alpha  = 0.5
            isHidden = true
        }
    }
    func show(animation: Bool) {
        self.isHidden = false
        if animation {
            UIView.animate(withDuration: 0.5) {
                self.backgroundView.alpha = 0.5
                self.contentView.alpha = 1
            }
        } else {
            backgroundView.alpha = 0.5
            contentView.alpha = 1
        }
    }
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        hide(animation: true)
        guard let delegate = delegate else { return }
        delegate.selectDate(datePicker: self, needsPerformAction: .done, selectDate: datePickerView.date)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        hide(animation: true)
        guard let delegate = delegate else { return }
        delegate.selectDate(datePicker: self, needsPerformAction: .cancel, selectDate: nil)
    }
}
