//
//  AnimationViewController.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - Private
    
    private var animationsData = [AnimationData]()
    
    private var counter = 0
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,
        minimumInteritemSpacing: 5,
        minimumLineSpacing: 5
    )
    
}

// MARK: - Setup

private extension AnimationViewController {
    
    func setup() {
        setupNavigationBar()
        setupCollectionView()
        setData()
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = .makeBackButton(
            target: self,
            action: #selector(backAction)
        )
        
        setTitle(AppStyle.ScreenType.animation.title)
        
        let chooseButton = UIBarButtonItem.makeButton(
            title: AppStyle.NavigationBarButton.choose.title,
            target: self,
            action: #selector(chooseAction)
        )
        navigationItem.rightBarButtonItems = [chooseButton]
        
        addShadowToBar()
    }
    
    func selectAnimation(index: Int) {
        let maxCount = 5
        
        if counter < maxCount {
            animationsData[index].isSelected = !animationsData[index].isSelected
        } else {
            animationsData[index].isSelected = false
        }
        
        let selectedAnimations = animationsData.filter { $0.isSelected }

        counter = selectedAnimations.count
        counterLabel.text = "\(counter)/\(maxCount)"
    }
    
}

// MARK: - User interaction

private extension AnimationViewController {
    
    @objc
    func backAction() {
        navigationController?.navigationBar.barTintColor = AppStyle.ScreenType.main.color
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func chooseAction() {
        print(#function)
    }

}

// MARK: - Setup CollectionView

private extension AnimationViewController {
    
    func setupCollectionView() {
        collectionView?.collectionViewLayout = columnLayout
        collectionView?.contentInsetAdjustmentBehavior = .always
        collectionView.register(nib: AnimationCollectionViewCell.self)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension AnimationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return animationsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(AnimationCollectionViewCell.self, for: indexPath)
        
        cell.set(model: animationsData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        selectAnimation(index: indexPath.row)
        
        collectionView.reloadData()
    }
 
}

// MARK: - Set

private extension AnimationViewController {
    
    func setData() {
        let array = [
            AnimationData(isSelected: false, image: "image_1"),
            AnimationData(isSelected: false, image: "image_2"),
            AnimationData(isSelected: false, image: "image_3"),
            AnimationData(isSelected: false, image: "image_4"),
            AnimationData(isSelected: false, image: "image_5"),
            AnimationData(isSelected: false, image: "image_6"),
            AnimationData(isSelected: false, image: "image_7"),
            AnimationData(isSelected: false, image: "image_8"),
            AnimationData(isSelected: false, image: "image_9"),
            AnimationData(isSelected: false, image: "image_10"),
        ]
        animationsData = array
        
        collectionView.reloadData()
    }
    
}
