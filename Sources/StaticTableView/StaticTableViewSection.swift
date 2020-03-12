//
//  StaticTableViewSection.swift
//  StaticTableView
//
//  Created by 于涵 on 2020/3/11.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

public class StaticTableViewSection: NSObject {

    public var headerView: StaticTableViewHeader?
    public var footerView: StaticTableViewFooter?
    
    public var cells: [StaticTableViewCell] = []
}
