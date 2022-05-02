//
//  StaticTableViewCell.swift
//  test001
//
//  Created by 于涵 on 2020/3/22.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

open class StaticTableViewCell: UIView, StaticTableViewElement {
    
    /// Custom handler performed when cell did select
    open var didSelectAction: (() -> Void)?
    
    /// Calculate cell height. Return 50 by defualt
    open func heightInTableView() -> CGFloat {
        return 50
    }
}
