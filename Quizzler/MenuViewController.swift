//
//  MenuViewController.swift
//  Quizzler
//
//  Created by Republisys on 19/04/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MenuViewController: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        bannerView.adUnitID = "ca-app-pub-3940256099942544/4411468910"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
}
