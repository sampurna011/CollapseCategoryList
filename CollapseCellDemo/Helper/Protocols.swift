//
//  Protocols.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 19/03/21.
//

import Foundation
import UIKit

protocol Identifiable: AnyObject {
    static var identifire: String { get }
}
// Default value of `identifire`: Your class name
extension Identifiable where Self: NSObject {
    static var identifire: String { return className }
}
protocol ClassNameProtocol {
    static var className: String {get}
    var className: String {get}
}
extension ClassNameProtocol {
    public static var className: String {
        return String(describing: self)
    }
    public var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
public extension UITableView {
    /// Register `UITableViewCell` for given identifire.
    /// Your cell XIB, UITableViewCell class and provided Identifire must be same to register the Cell.
    ///
    /// - Parameter identifire: Reusable identifire for cell.
    func registerCell(_ identifire: String) {
        let nib = UINib(nibName: identifire, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifire)
    }
    /// Register `HeaderView` for given identifire.
    ///
    /// - Parameter identifire: Reusable identifire for header.
    func registerHeaderFooterView(_ identifire: String) {
        let nib = UINib(nibName: identifire, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifire)
    }
}
