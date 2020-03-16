//
//  MainViewController.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/12/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var navigator: MainNavigator?
    
    private var shuffler: Shuffler?
    
    private let minimumNumberOfSeats = 4
    private let maximumNumberOfSeats = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        shuffler = ShufflingHandler()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        navigator = MainNavigationHandler(viewController: self, storyboard: storyboard)

        handleShuffleAction()
    }
    
    // MARK: - Actions
    
    private func handleShuffleAction() {
        guard let view = view as? MainView else { return }
        
        view.shuffle = { [unowned self] number in           
            if number == 0  {
                self.showAlert(withTitle: "Seats", message: "Please add a number of seats bigger than 0.", cancelActionTitle: "OK")
            } else if number > self.maximumNumberOfSeats {
                self.showAlert(withTitle: "Maximum seats", message: "The maximum number of seats allowed in a table is \(self.maximumNumberOfSeats). Please choose a lower number", cancelActionTitle: "OK.")
            } else if number < self.minimumNumberOfSeats {
                self.showAlert(withTitle: "Minimum seats", message: "The minimum number of seats allowed in a table is \(self.minimumNumberOfSeats). Please choose a higher number", cancelActionTitle: "OK.")
            } else if let shuffler = self.shuffler {
                self.navigateToSeats(withSeatNumbers: shuffler.shuffledNumbers(withTotalOf: number))
            }
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    
    private func navigateToSeats(withSeatNumbers seats: [Int]) {
        navigator?.navigateToSeatsViewController(withSeatNumbers: seats, completion: { [weak view] in
            guard let view = view as? MainView else { return }
            view.resetTextField()
        })
    }

}

