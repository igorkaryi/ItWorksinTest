//
//  MainViewController.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet private weak var topButton: UIButton!
    @IBOutlet private weak var animationButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

// MARK: - Setup

private extension MainViewController {
    
    func setup() {
        setupNavigationBar()

        addCornerRadiusOnButton(topButton)
        addCornerRadiusOnButton(animationButton)
    }
    
    func setupNavigationBar() {
        setTitle(AppStyle.ScreenType.main.title)
        
        addShadowToBar()
    }
    
    func addCornerRadiusOnButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
    }
    
}

// MARK: - User interaction

private extension MainViewController {
    
    @IBAction
    func topAction(_ sender: UIButton) {
        guard let vc = UIStoryboard.load(controller: .top) as? TopViewController else { return }
        
        navigationController?.navigationBar.barTintColor = AppStyle.ScreenType.top.color
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    func animationAction(_ sender: UIButton) {
        guard let vc = UIStoryboard.load(controller: .animation) as? AnimationViewController else { return }
        
        navigationController?.navigationBar.barTintColor = AppStyle.ScreenType.animation.color
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
