//
//  SeatCollectionViewCell.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/14/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    
    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    @IBOutlet private weak var numberLabel: UILabel!
}
