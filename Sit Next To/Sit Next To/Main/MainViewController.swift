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
           
            if number > self.maximumNumberOfSeats {
                self.showAlertFor(maximumSeats: self.maximumNumberOfSeats)
            }else if let shuffler = self.shuffler {
                self.navigateToSeats(withSeatNumbers: shuffler.shuffledNumbers(withTotalOf: number))
            }
        }
    }
    
    private func showAlertFor(maximumSeats: Int) {
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        let alertController = UIAlertController(title: "Maximum seats", message: "The maximum allowed number of seats in a table is \(maximumSeats). Please choose a lower number", preferredStyle: .alert)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    // MARK: - Navigation
    
    private func navigateToSeats(withSeatNumbers seats: [Int]) {
        navigator?.navigateToSeatsViewController(withSeatNumbers: seats)
    }

}

