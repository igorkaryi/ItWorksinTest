//
//  UIStoryboard+Ext.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

enum StoryBoardName: String {
    case main = "Main"
}

enum ControllerName: String {
    case main = "MainViewController"
    case top = "TopViewController"
    case animation = "AnimationViewController"
}

extension UIStoryboard {

    class func load(_ storyboard: StoryBoardName = .main, controller: ControllerName) -> UIViewController {
        let st = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        
        return st.instantiateViewController(withIdentifier: controller.rawValue)
    }
    
}
