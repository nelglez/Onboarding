//
//  StartViewController.swift
//  OnBoarding
//
//  Created by Nelson Gonzalez on 5/28/19.
//  Copyright © 2019 Umair Afzal. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        checkForOnboarding()
    }
    

    private func checkForOnboarding() {
        
        let userDefaults = UserDefaults.standard
        
        print(userDefaults.bool(forKey: "onboarded"))
        
        if !userDefaults.bool(forKey: "onboarded") {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MyViewController")
                self.present(vc, animated: false, completion: nil)
            }
            
        }
        
    }
    
}
