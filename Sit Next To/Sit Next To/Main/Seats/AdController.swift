//
//  AdController.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/21/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit
import GoogleMobileAds

protocol AdController {
    var adView: UIView { get }
    
    func loadAd()
    func addAdView(toViewController viewController: UIViewController)
}

class AdControllerHandler: AdController {
    
    let adView: UIView
    
    init() {
        let bannerView = GADBannerView()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        adView = bannerView
    }
    
    func addAdView(toViewController viewController: UIViewController) {
        guard let adView = adView as? GADBannerView else { return }
        
        adView.rootViewController = viewController
    }
    
    func loadAd() {
        guard let adView = adView as? GADBannerView else { return }
        
        adView.load(GADRequest())
    }
}
