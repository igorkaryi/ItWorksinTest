//
//  UIViewController+Ext.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setTitle(_ title: String, andImage image: UIImage?) {
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textColor = UIColor.white
        titleLbl.font = AppStyle.Font.get(.helveticaNeue(.medium), size: 20)
        let imageView = UIImageView(image: image)
        let titleView = UIStackView(arrangedSubviews: [imageView, titleLbl])
        titleView.axis = .horizontal
        titleView.spacing = 10.0
        navigationItem.titleView = titleView
    }
    
    func setTitle(_ title: String) {
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textColor = UIColor.white
        titleLbl.font = AppStyle.Font.get(.helveticaNeue(.medium), size: 20)
        let titleView = UIStackView(arrangedSubviews: [titleLbl])
        navigationItem.titleView = titleView
    }
    
    
    func addShadowToBar() {
        let shadowView = UIView(frame: navigationController!.navigationBar.frame)
        shadowView.backgroundColor = .white
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowRadius = 4
        view.addSubview(shadowView)
    }
    
}
