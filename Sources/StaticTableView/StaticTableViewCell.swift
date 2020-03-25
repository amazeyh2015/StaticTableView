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
    
    /// Transform between regular and selected state,  does nothing by default
    open func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    /// Transform between regular and highlighted state,  does nothing by default
    open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
    }
    
    open func heightInTableView(_ tableView: StaticTableView) -> CGFloat {
        return 50
    }
}
