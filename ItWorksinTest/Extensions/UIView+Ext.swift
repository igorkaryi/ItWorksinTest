//
//  UIView+Ext.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

// MARK: - Animation logic

extension UIView {
    
    @inline(__always)
    static func defaultAnimate(duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        performAnimation(duration: duration, block: animations, completion: completion)
    }
    
    @inline(__always)
    static func defaultAnimate(duration: TimeInterval, delay: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        performAnimation(duration: duration, delay: delay, block: animations, completion: completion)
    }
    
    @inline(__always)
    static func defaultAnimate(animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        defaultAnimate(
            duration: CATransaction.animationDuration(),
            animations: animations,
            completion: completion
        )
    }
    
    @inline(__always)
    static func perfromAnimationIfNeeded(animated: Bool, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        if animated {
            UIView.defaultAnimate(animations: animations, completion: completion)
        } else {
            animations()
            completion?(true)
        }
    }
    
    @inline(__always)
    static func performAnimation(duration: TimeInterval, block: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        performAnimation(duration: duration, delay: 0, block: block, completion: completion)
    }
    
    static func performAnimation(duration: TimeInterval, delay: TimeInterval, block: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        if #available(iOS 10.0, *) {
            let anim = UIViewPropertyAnimator(
                duration: duration,
                curve: .easeInOut,
                animations: block
            )
            
            anim.addCompletion { pos in
                if pos == .end {
                    completion?(true)
                }
            }
            
            anim.startAnimation()
        } else {
            UIView.animate(
                withDuration: duration,
                delay: 0,
                options: [.beginFromCurrentState, .curveEaseInOut],
                animations: block,
                completion: completion
            )
        }
    }
    
    func addAnimationIfNeeded(_ animated: Bool) {
        if animated {
            let transition = CATransition()
            transition.duration = CATransaction.animationDuration()
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            transition.isRemovedOnCompletion = true
            layer.add(transition, forKey: nil)
        }
    }
    
}

extension UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    class func viewWithDefaultNib() -> Self {
        return self.viewWithType()
    }
    
    class func defaultNib() -> UINib {
        return UINib(nibName: stringFromClass(self), bundle: nil)
    }

}

// MARK: - Private Methods

private extension UIView {
    
    class func viewWithType<T>() -> T {
        let nib = UINib(nibName: stringFromClass(self), bundle: nil)
        
        return nib.instantiate(withOwner: nil, options: nil).first as! T
    }
    
    class func stringFromClass(_ anyClass: AnyClass) -> String {
        return NSStringFromClass(anyClass).components(separatedBy: ".").last!
    }
    
}
