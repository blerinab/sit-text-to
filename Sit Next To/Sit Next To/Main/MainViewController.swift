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
    
    private let maximumNumberOfSeats = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        shuffler = ShufflingHandler()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        navigator = MainNavigationHandler(viewController: self, storyboard: storyboard)
        
        handleShuffleAction()
    }
    
    // MARK: - Actions
    
    private func handleShuffleAction() {
        guard let view = view as? MainView else { return }
        
        view.shuffle = { [unowned self] number in
            // TODO: Show adds
           
            if number == 0  {
                self.showAlert(withTitle: "Seats", message: "Please add a seat number bigger than 0.", cancelActionTitle: "OK")
            } else if number > self.maximumNumberOfSeats {
                self.showAlert(withTitle: "Maximum seats", message: "The maximum allowed number of seats in a table is \(self.maximumNumberOfSeats). Please choose a lower number", cancelActionTitle: "OK")
            } else if let shuffler = self.shuffler {
                self.navigateToSeats(withSeatNumbers: shuffler.shuffledNumbers(withTotalOf: number))
            }
        }
    }
    
    // MARK: - Navigation
    
    private func navigateToSeats(withSeatNumbers seats: [Int]) {
        navigator?.navigateToSeatsViewController(withSeatNumbers: seats, completion: { [weak view] in
            guard let view = view as? MainView else { return }
            view.resetTextField()
        })
    }

}

