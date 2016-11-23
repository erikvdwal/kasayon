//
//  UICollectionView+Ext.swift
//  Pods
//
//  Created by Erik van der Wal on 20/11/2016.
//
//

import Foundation
import UIKit

public extension UICollectionView {
    
    /// Register a collectionview cell class with a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    ///   - bundle: The bundle containing the nib file
    public func register<T: UICollectionViewCell where T: ReusableView, T: NibLoadable>(class: T.Type, bundle: NSBundle? = nil) {
        registerNib(UINib(nibName: T.nibName, bundle: bundle), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register a collectionview cell class without a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    public func register<T: UICollectionViewCell where T: ReusableView>(class: T.Type) {
        registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register a supplementary view with a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    ///   - bundle: The bundle containing the nib file
    ///   - kind: The kind of view to register
    public func register<T: UICollectionReusableView where T: ReusableView, T: NibLoadable>(class: T.Type, bundle: NSBundle? = nil, forKind kind: String) {
        registerNib(UINib(nibName: T.nibName, bundle: bundle), forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register a supplementary view without a nib
    ///
    /// - Parameters:
    ///   - class: The class to register
    ///   - kind: The kind of view to register
    public func register<T: UICollectionReusableView where T: ReusableView>(class: T.Type, forKind kind: String) {
        registerClass(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Dequeue a cell of the inferred type and given index path
    ///
    /// - Parameter indexPath: The index path to dequeue the cell for
    /// - Returns: The typed uicollectionview cell
    public func dequeueCell<T: UICollectionViewCell where T: ReusableView>(forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError("Could not dequeue a cell with reuseidentifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    /// Dequeue a supplementary view of the inferred type and given index path
    ///
    /// - Parameters:
    ///   - kind: The kind of view to dequeue
    ///   - indexPath: The indexpath to dequeue the supplementary view for
    /// - Returns: The typed reusable view
    public func dequeueSupplementaryView<T: UICollectionReusableView where T: ReusableView>(ofKind kind: String, forIndexPath indexPath: NSIndexPath) -> T {
        guard let view = dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError("Could not dequeue a supplementary view of kind: \(kind), reuseidentifier: \(T.reuseIdentifier)")
        }
        
        return view
    }
    
}
