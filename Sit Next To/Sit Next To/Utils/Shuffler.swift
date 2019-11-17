
//
//  Shuffler.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/14/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import Foundation

protocol Shuffler {
    func shuffledNumbers(withTotalOf: Int) -> [Int]
}

struct ShufflingHandler: Shuffler {
    func shuffledNumbers(withTotalOf number: Int) -> [Int] {
        if number == 0 {
            return []
        }
        let numbers: [Int] = Array(1...number)
        return numbers.shuffled()
    }
}
