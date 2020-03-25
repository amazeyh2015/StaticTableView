//
//  StaticTableViewSection.swift
//  test001
//
//  Created by 于涵 on 2020/3/22.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

public class StaticTableViewSection {
    
    /// Cells in section
    public var cells: [StaticTableViewCell] = []
    
    /// Header view for section
    public var header: StaticTableViewHeader?
    
    /// Footer view for section
    public var footer: StaticTableViewFooter?
    
    public init() {}
}
