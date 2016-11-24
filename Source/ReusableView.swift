//
//  ReusableView.swift
//  Pods
//
//  Created by Erik van der Wal on 20/11/2016.
//
//

import UIKit

/// ReusableView can be used with any view that is reusable
public protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// A tableviewcell is reusable by default
extension UITableViewCell: ReusableView {}

// A tableviewheaderfooterview is reusable by default
extension UITableViewHeaderFooterView: ReusableView {}

// A collectionreusableView is reusable by default
extension UICollectionReusableView: ReusableView {}
