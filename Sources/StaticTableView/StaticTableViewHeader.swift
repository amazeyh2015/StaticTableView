//
//  StaticTableViewHeader.swift
//  test001
//
//  Created by 于涵 on 2020/3/22.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

open class StaticTableViewHeader: UIView, StaticTableViewElement {
    
    /// Calculate header height. Return 30 by defualt
    open func heightInTableView() -> CGFloat {
        return 30
    }
}
