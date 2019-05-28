//
//  MyViewController.swift
//  OnBoarding
//
//  Created by Nelson Gonzalez on 5/28/19.
//  Copyright © 2019 Umair Afzal. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let onboardingController = OnboardingController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        setUI()
    }
    
    private func setUI() {
        getStartedButton.layer.cornerRadius = getStartedButton.frame.height/2
        pageControl.numberOfPages = onboardingController.onboarding.count
        getStartedButton.isHidden = true
        
       
    }
    
    private func setUserDefaultsValue() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboarded")
    }
    
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        
        setUserDefaultsValue()
    }
    @IBAction func skipButtonnPressed(_ sender: UIButton) {
        
        setUserDefaultsValue()
    }
    
}

extension MyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingController.onboarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as! MyCollectionViewCell
        
        let onboarding = onboardingController.onboarding[indexPath.item]
        cell.onboarding = onboarding
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
        
        if pageControl.currentPage == 4 {
            getStartedButton.isHidden = false
        }
        //No need for the else, dont like how it looks..
//        } else {
//            getStartedButton.isHidden = true
//        }

        print(pageControl.currentPage)
        print("INDEX: \(indexPath.item)")
    }
    
    
}
