//
//  StaticTableViewFooter.swift
//  test001
//
//  Created by 于涵 on 2020/3/22.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

open class StaticTableViewFooter: UIView, StaticTableViewElement {
    
    /// Calculate cell height with its table view. Return 30 by defualt
    open func heightInTableView(_ tableView: StaticTableView) -> CGFloat {
        return 30
    }
}
