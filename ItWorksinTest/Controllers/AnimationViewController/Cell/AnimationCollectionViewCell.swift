//
//  AnimationCollectionViewCell.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 05.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class AnimationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var checkboxView: UIView!
    @IBOutlet weak var checkboxImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
}

// MARK: - Setup

private extension AnimationCollectionViewCell {
    
    func setup() {
        setupCheckbox()
        setupContainerView()
    }
    
    func setupCheckbox() {
        checkboxView.layer.shadowColor = UIColor.black.cgColor
        checkboxView.layer.shadowOffset = CGSize(width: 3, height: 3)
        checkboxView.layer.shadowOpacity = 0.2
        checkboxView.layer.shadowRadius = 4.0
        
        checkboxView.layer.cornerRadius = 11
        checkboxView.layer.borderWidth = 1.0
        checkboxView.layer.borderColor = #colorLiteral(red: 0.815623343, green: 0.8157219291, blue: 0.815589726, alpha: 1).cgColor
    }
    
    func setupContainerView() {
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = #colorLiteral(red: 0.815623343, green: 0.8157219291, blue: 0.815589726, alpha: 1).cgColor
    }
    
}

// MARK: - Set

extension AnimationCollectionViewCell {
    
    func set(model: AnimationData) {
        checkboxImageView.image = model.isSelected
            ? UIImage(named: "checkbox_icon")
            : UIImage(named: "checkbox_empty_icon")
        
        imageView.image = UIImage(named: model.image)
    }
    
}
