//
//  LogInViewController.swift
//  Quizzler
//
//  Created by Republisys on 19/04/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import GoogleMobileAds


class LogInViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitialAd : GADInterstitial!
    
    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        self.interstitialAd.load(request)
        self.interstitialAd = reloadInterstitialAd()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadInterstitialAd() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        self.interstitialAd = reloadInterstitialAd()
    }
    
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        if self.interstitialAd.isReady {
            self.interstitialAd.present(fromRootViewController: self)
        SVProgressHUD.show()
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
                SVProgressHUD.dismiss()
                ProgressHUD.showError("Login Error")
                //self.performSegue(withIdentifier: "goToRoot1", sender: self)
            } else {
                print("Login successful!")
                SVProgressHUD.dismiss()
                ProgressHUD.showSuccess("Login successful!")
                
                self.performSegue(withIdentifier: "goToMenu1", sender: self)
            }
            }
        } else {
            ProgressHUD.showError("Ad not ready")
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRoot1", sender: self)
    }
    
    
    
} 
