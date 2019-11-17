//
//  NavigationController.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/14/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    static func create(withRootViewController viewController: UIViewController) -> UINavigationController? {
        let storyboard = UIStoryboard(name: "Navigation", bundle: Bundle.main)
        let navigationController = storyboard.instantiateViewController(identifier: "NavigationController") as? NavigationController
        navigationController?.setViewControllers([viewController], animated: true)
        return navigationController
    }

}
