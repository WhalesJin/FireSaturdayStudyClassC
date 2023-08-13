//
//  Identifier.swift
//  KeyChain_Practice
//
//  Created by Dasan on 2023/08/13.
//

import UIKit

protocol Identifier {}

extension Identifier where Self: UIViewController {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
