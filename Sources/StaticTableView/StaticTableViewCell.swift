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
    
    /// Transform between regular and selected state. Does nothing by default
    open func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    /// Calculate cell height with its table view. Return 50 by defualt
    open func heightInTableView(_ tableView: StaticTableView) -> CGFloat {
        return 50
    }
}
