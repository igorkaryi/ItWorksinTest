//
//  UIBarButtonItem+Ext.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    static func makeBackButton(target: Any, action: Selector) -> Self {
        let button = UIButton(type: .custom)
        button.setImage(AppStyle.NavigationBarButton.back.icon, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        return .init(customView: button)
    }
    
    static func makeButton(image: UIImage?, target: Any, action: Selector) -> Self {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        return .init(customView: button)
    }
    
    static func makeButton(title: String, target: Any, action: Selector) -> Self {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = AppStyle.Font.get(.helveticaNeue(.regular), size: 16)
        button.addTarget(target, action: action, for: .touchUpInside)

        return .init(customView: button)
    }
    
}
