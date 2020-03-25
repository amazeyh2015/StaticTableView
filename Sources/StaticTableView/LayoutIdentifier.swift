//
//  LayoutIdentifier.swift
//  
//
//  Created by 于涵 on 2020/3/25.
//

import UIKit

struct LayoutIdentifier {
    
    let size: CGSize
    let layoutMargins: UIEdgeInsets
    
    init(_ size: CGSize, _ layoutMargins: UIEdgeInsets) {
        self.size = size
        self.layoutMargins = layoutMargins
    }
}

extension LayoutIdentifier: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.size.width != rhs.size.width {
            return false
        }
        if lhs.layoutMargins.left != rhs.layoutMargins.left {
            return false
        }
        if lhs.layoutMargins.right != rhs.layoutMargins.right {
            return false
        }
        return true
    }
}
