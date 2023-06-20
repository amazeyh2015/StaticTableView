//
//  StaticTableViewFooter.swift
//  test001
//
//  Created by 于涵 on 2020/3/22.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

open class StaticTableViewFooter: UIView, StaticTableViewElement {
    
    public init() {
        super.init(frame: .zero)
        
        preservesSuperviewLayoutMargins = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var lastLayoutMargin: UIEdgeInsets = .zero
    var lastLayoutSize: CGSize = .zero
    
    func updateSubviewsLayoutIfNeeded() {
        if layoutMargins == lastLayoutMargin && frame.size == lastLayoutSize {
            return
        }
        lastLayoutMargin = layoutMargins
        lastLayoutSize = frame.size
        updateSubviewsLayout()
    }
    
    open override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        updateSubviewsLayoutIfNeeded()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateSubviewsLayoutIfNeeded()
    }
    
    /// Calculate footer height. Return 30 by defualt
    open func heightInTableView() -> CGFloat {
        return 30
    }
    
    /// Do actually layout for footer's subviews
    open func updateSubviewsLayout() {
        
    }
}
