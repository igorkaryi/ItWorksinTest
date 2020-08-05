//
//  UITableView+Ext.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 05.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

// MARK: - Cell

extension UITableView {
    
    /// Register nib for reuse
    @discardableResult
    func register<T: UITableViewCell>(nib cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
        return self
    }
    
    /// Register class for reuse
    @discardableResult
    func register<T: UITableViewCell>(class cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(cell.self, forCellReuseIdentifier: className)
        return self
    }

    @discardableResult
    func register(classes cells: UITableViewCell.Type...) -> Self {
        cells.forEach { register(class: $0) }
        return self
    }

    @discardableResult
    func register(nibs cells: UITableViewCell.Type...) -> Self {
        cells.forEach { register(nib: $0) }
        return self
    }
    
    /// Returns reusable cell
    func dequeue<T: UITableViewCell>(class cell: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: cell)
        return dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
    
}

// MARK: - Header/Footer

extension UITableView {

    /// Register class for reuse header
    @discardableResult
    func register<T: UITableViewHeaderFooterView>(nibForHeaderFooter cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forHeaderFooterViewReuseIdentifier: className)
        return self
    }
    
    /// Register class for reuse header
    @discardableResult
    func register<T: UITableViewHeaderFooterView>(classForHeaderFooter cell: T.Type) -> Self {
        let className = String(describing: cell)
        register(cell.self, forHeaderFooterViewReuseIdentifier: className)
        return self
    }
    
    /// Returns reusable cell
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass view: T.Type) -> T {
        let className = String(describing: view)
        return dequeueReusableHeaderFooterView(withIdentifier: className) as! T
    }
    
}
