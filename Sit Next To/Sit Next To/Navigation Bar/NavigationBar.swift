//
//  NavigationBar.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/12/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }
    
    func configureAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = Colors.mainColor
        navBarAppearance.shadowColor = nil
        standardAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
    }
}
