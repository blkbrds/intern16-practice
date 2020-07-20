//
//  Bai10ViewController.swift
//  Auto Layout

import UIKit

class Bai10ViewController: UIViewController {
    //MARK: - IBOutlet private
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet weak var constraintHeightGreen: NSLayoutConstraint!
    @IBOutlet weak var constraintHeightBlue: NSLayoutConstraint!
    @IBOutlet weak var constraintHeightYellow: NSLayoutConstraint!
    @IBOutlet weak var constraintHeightRed: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        greenView.isUserInteractionEnabled = true
        let tapGreen = UITapGestureRecognizer(target: self, action: #selector(tapImageGreen))
        greenView.addGestureRecognizer(tapGreen)
        
        blueView.isUserInteractionEnabled = true
        let tapBlue = UITapGestureRecognizer(target: self, action: #selector(tapImageBlue))
        blueView.addGestureRecognizer(tapBlue)
        
        yellowView.isUserInteractionEnabled = true
        let tapYellow = UITapGestureRecognizer(target: self, action: #selector(tapImageYellow))
        yellowView.addGestureRecognizer(tapYellow)
        
        redView.isUserInteractionEnabled = true
        let tapRed = UITapGestureRecognizer(target: self, action: #selector(tapImageRed))
        redView.addGestureRecognizer(tapRed)
        
    }
    
    //MARK: - function private
    private func setUI(){
        greenView.layer.shadowOpacity = 5
        greenView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        greenView.layer.cornerRadius = 10
        
        blueView.layer.shadowOpacity = 5
        blueView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        blueView.layer.cornerRadius = 10
        
        yellowView.layer.shadowOpacity = 5
        yellowView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        yellowView.layer.cornerRadius = 10
        
        redView.layer.shadowOpacity = 5
        redView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        redView.layer.cornerRadius = 10
    }
    
    @objc func tapImageGreen() {
        self.constraintHeightGreen.constant = 200
        self.constraintHeightBlue.constant = 100
        self.constraintHeightYellow.constant = 100
        self.constraintHeightRed.constant = 100
    }
    @objc func tapImageBlue() {
        self.constraintHeightGreen.constant = 100
        self.constraintHeightBlue.constant = 200
        self.constraintHeightYellow.constant = 100
        self.constraintHeightRed.constant = 100
    }
    @objc func tapImageYellow() {
        self.constraintHeightGreen.constant = 100
        self.constraintHeightBlue.constant = 100
        self.constraintHeightYellow.constant = 200
        self.constraintHeightRed.constant = 100
    }
    @objc func tapImageRed() {
        self.constraintHeightGreen.constant = 100
        self.constraintHeightBlue.constant = 100
        self.constraintHeightYellow.constant = 100
        self.constraintHeightRed.constant = 200
    }

}
