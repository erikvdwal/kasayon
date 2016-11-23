//
//  UITableView+Ext.swift
//  Pods
//
//  Created by Erik van der Wal on 20/11/2016.
//
//

import Foundation
import UIKit

extension UITableView {
    
    /// Register a tableview cell class with a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    ///   - bundle: The bundle containing the nib file
    public func register<T: UITableViewCell where T: ReusableView, T: NibLoadable>(class: T.Type, bundle: NSBundle? = nil) {
        registerNib(UINib(nibName: T.nibName, bundle: bundle), forCellReuseIdentifier: T.reuseIdentifier)
    }

    /// Register a tableview cell class without a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    public func register<T: UITableViewCell where T: ReusableView>(class: T.Type, bundle: NSBundle? = nil) {
        registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register a tableheaderfooterview with a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    ///   - bundle: The bundle containing the nib file
    public func register<T: UITableViewHeaderFooterView where T: ReusableView, T: NibLoadable>(class: T.Type, bundle: NSBundle? = nil) {
        registerNib(UINib(nibName: T.nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    /// Register a tableheaderfooterview view without a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    public func register<T: UITableViewHeaderFooterView where T: ReusableView>(class: T.Type) {
        registerClass(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
 
    /// Dequeue a cell of the inferred type and given index path
    ///
    /// - Parameter indexPath: The index path to dequeue the cell for
    /// - Returns: The typed tableview cell
    public func dequeueCell<T: UITableViewCell where T: ReusableView>(forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError("Could not dequeue a cell with reuseidentifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }

    /// Dequeue a tableheaderfooterview of the inferred type and given index path
    ///
    /// - Parameter indexPath: The index path to dequeue the cell for
    /// - Returns: The typed tableheaderfooterview
    public func dequeueHeaderFooterView<T: UITableViewHeaderFooterView where T: ReusableView>() -> T {
        guard let view = dequeueReusableHeaderFooterViewWithIdentifier(T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue a cell with reuseidentifier: \(T.reuseIdentifier)")
        }
        
        return view
    }
    
}
