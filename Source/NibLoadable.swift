//
//  NibLoadable.swift
//  Pods
//
//  Created by Erik van der Wal on 20/11/2016.
//
//

import UIKit

/// NibLoadable is used with classes that can be loaded via a nib with the same name
public protocol NibLoadable: class {
    static var nibName: String { get }
}

public extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}


public extension NibLoadable where Self: UIView {
    /// Instantiate a class from a nibfile
    ///
    /// - Parameters:
    ///   - owner: The nib and class owner
    ///   - bundle: The bundle containing the nib
    /// - Returns: The instantiated class
    static func instantiateFromNib(owner: AnyObject? = nil, bundle: Bundle? = nil) -> Self {
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self else {
            fatalError("Could not instantiate \(nibName) from nib")
        }
        
        return view
    }
}
