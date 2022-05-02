//
//  StaticTableViewElement.swift
//  test001
//
//  Created by 于涵 on 2020/3/23.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

public protocol StaticTableViewElement: UIView {
    
    /// Calculate element height
    func heightInTableView() -> CGFloat
}
