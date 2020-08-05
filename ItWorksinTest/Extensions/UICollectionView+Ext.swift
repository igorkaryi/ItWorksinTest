//
//  UICollectionView+Ext.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 05.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /// Register nib for reuse
    @discardableResult
    func register<T: UICollectionViewCell>(nib cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
        return self
    }

    /// Register class for reuse
    @discardableResult
    func register<T: UICollectionViewCell>(class cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(cell, forCellWithReuseIdentifier: className)
        return self
    }

    
    /// Returns reusable cell
    func dequeue<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: cell)
        let cell = dequeueReusableCell(withReuseIdentifier: className, for: indexPath)
        return cell as! T
    }

    @discardableResult
    func register(classes cells: UICollectionViewCell.Type...) -> Self {
        cells.forEach { register(class: $0) }
        return self
    }
    
}


// MARK: - Header

extension UICollectionView {

    /// Register nib for reuse header
    @discardableResult
    func register<T: UICollectionReusableView>(nibForHeader cell: T.Type) -> Self {
        let className = String(describing: cell)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: className)
        return self
    }

    /// Register class for reuse header
    @discardableResult
    func register<T: UICollectionReusableView>(classForHeader cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: className)
        return self
    }

    /// Returns reusable header
    func dequeueReusableHeaderView<T: UICollectionReusableView>(withClass view: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: view)
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: className,
            for: indexPath
        ) as! T
    }

}

// MARK: - Footer

extension UICollectionView {

    /// Register nib for reuse footer
    @discardableResult
    func register<T: UICollectionReusableView>(nibForFooter cell: T.Type) -> Self {
        let className = String(describing: cell)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: className)
        return self
    }

    /// Register class for reuse footer
    @discardableResult
    func register<T: UICollectionReusableView>(classForFooter cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: className)
        return self
    }

    /// Returns reusable footer
    func dequeueReusableFooterView<T: UICollectionReusableView>(withClass view: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: view)
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: className,
            for: indexPath
        ) as! T
    }

}
