//
//  MyCollectionViewCell.swift
//  OnBoarding
//
//  Created by Nelson Gonzalez on 5/28/19.
//  Copyright © 2019 Umair Afzal. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var onboarding: OnBoarding? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    private func updateViews() {
        guard let onboarding = onboarding else { return }
        myImageView.image = onboarding.topImage
        titleLabel.text = onboarding.heading
        descriptionLabel.text = onboarding.description
    }
    
}
