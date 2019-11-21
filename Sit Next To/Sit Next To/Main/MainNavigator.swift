//
//  MainNavigator.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/14/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

protocol MainNavigator {
    func navigateToSeatsViewController(withSeatNumbers: [Int], completion: (() -> Void)?)
}

class MainNavigationHandler: MainNavigator {

    weak var viewController: UIViewController?
    let storyboard: UIStoryboard

    init(viewController: UIViewController, storyboard: UIStoryboard) {
        self.viewController = viewController
        self.storyboard = storyboard
    }
    
    func viewController(withIdentifier identifier: String) -> UIViewController? {
        let viewController = storyboard.instantiateViewController(identifier: identifier)
        return viewController
    }
    
    func navigateToSeatsViewController(withSeatNumbers numbers: [Int], completion: (() -> Void)? = nil) {
        guard let seatsViewController = viewController(withIdentifier: "SeatsViewController") as? SeatsViewController else { return }

        seatsViewController.seatNumbers = numbers
        seatsViewController.shuffler = ShufflingHandler()
        
        seatsViewController.needsNewSeats = { [unowned seatsViewController] in
            seatsViewController.dismiss(animated: true, completion: completion)
        }
        
        if let navigationController = NavigationController.create(withRootViewController: seatsViewController) {
            navigationController.modalPresentationStyle = .fullScreen
            viewController?.present(navigationController, animated: false, completion: completion)
        }
    }
}
