//
//  TopTableViewCell.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 05.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class TopTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    @IBOutlet private weak var sequenceNumber: UILabel!
    @IBOutlet private weak var countLikesLabel: UILabel!
    @IBOutlet private weak var deviderView: UIView!
    @IBOutlet private weak var bigImageView: UIImageView!
    @IBOutlet private weak var smallImageView: UIImageView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var fullNameLabel: UILabel!
    
}

// MARK: - Set

extension TopTableViewCell {
    
    func set(model: TopModel, index: Int) {
        sequenceNumber.text = String(index)
        countLikesLabel.text = String(model.countLikes)
        bigImageView.image = UIImage(named: model.bigImage)
        smallImageView.image = UIImage(named: model.smallImage)
        numberLabel.text = model.number
        titleLabel.text = model.title
        fullNameLabel.text = model.fullName
    }
    
}
