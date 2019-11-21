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
    
    @IBOutlet private weak var numberTextField: UITextField!
    
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
