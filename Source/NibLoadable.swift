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
        return String(self)
    }
}
