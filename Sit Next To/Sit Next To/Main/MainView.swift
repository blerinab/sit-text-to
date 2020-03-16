//
//  MainView.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/12/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class MainView: UIView {
 
    var shuffle: ((_ number: Int) -> Void)?
    
    @IBOutlet private var shuffleButton: UIButton! {
        didSet {
            shuffleButton.alpha = 0
        }
    }
    
    @IBOutlet private var numberTextField: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Keyboard
    
    @objc private func keyboardWillBeShown(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.shuffleButton.alpha = 1
        }
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.shuffleButton.alpha = 0
        }
    }

    // MARK: - Actions
    
    @IBAction private func randomize(_ sender: UIButton) {
        if let numberText = numberTextField.text, let number = Int(numberText) {
            shuffle?(number)
        }
    }
    
    func resetTextField() {
        numberTextField.text = nil
    }
}
