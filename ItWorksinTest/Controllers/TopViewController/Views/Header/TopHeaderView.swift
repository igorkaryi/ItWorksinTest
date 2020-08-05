//
//  TopHeaderView.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 05.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class TopHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
}

// MARK: - Setup

extension TopHeaderView {
    
    func setup() {
        bgView.layer.cornerRadius = 6
        bgView.layer.masksToBounds = true
    }
    
}

// MARK: - Set

extension TopHeaderView {
    
    func set(title: String) {
        titleLabel.text = title
    }
    
}
