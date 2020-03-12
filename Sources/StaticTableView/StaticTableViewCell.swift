//
//  StaticTableViewCell.swift
//  StaticTableView
//
//  Created by 于涵 on 2020/3/11.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

open class StaticTableViewCell: UITableViewCell {

    open var selectAction: (() -> Void)?
    
    open var willDisplayHandler: (() -> Void)?
    open var didEndDisplayingHandler: (() -> Void)?
}
