//
//  StaticTableView.swift
//  test001
//
//  Created by 于涵 on 2020/3/22.
//  Copyright © 2020 yuhan. All rights reserved.
//

import UIKit

public class StaticTableView: UIScrollView {
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground
        preservesSuperviewLayoutMargins = true
        alwaysBounceVertical = true
        
        let tgr = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped(_:)))
        addGestureRecognizer(tgr)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Update layout if frame changed
    public override var frame: CGRect {
        didSet {
            updateLayoutIfNeeded()
        }
    }
    
    // Update layout if layout margins changed
    public override func layoutMarginsDidChange() {
        updateLayoutIfNeeded()
    }
    
    /// Set sections for table view. This will automatically reset the elements by current sections.
    public var sections: [StaticTableViewSection] = [] {
        didSet {
            removeAllElements()
            addAllElements()
        }
    }
    
    /// Store all table view elements
    var elements: [StaticTableViewElement] = []
    
    /// Store all table view cells
    var cells: [StaticTableViewCell] = []
    
    func removeAllElements() {
        for element in elements {
            element.removeFromSuperview()
        }
        elements = []
        cells = []
    }
    
    func addAllElements() {
        for section in sections {
            if let header = section.header {
                addSubview(header)
                elements.append(header)
            }
            for cell in section.cells {
                addSubview(cell)
                elements.append(cell)
                cells.append(cell)
            }
            if let footer = section.footer {
                addSubview(footer)
                elements.append(footer)
            }
        }
    }
    
    var lastLayoutWidth: CGFloat = 0
    
    var lastLayoutMargin: UIEdgeInsets = .zero
    
    /// Update lauout for subviews if layout infomation changed
    func updateLayoutIfNeeded() {
        if frame.width == lastLayoutWidth && layoutMargins == lastLayoutMargin {
            return
        }
        lastLayoutWidth = frame.width
        lastLayoutMargin = layoutMargins
        updateLayout()
    }
    
    /// Update layout for all elements in table view
    public func updateLayout() {
        var y: CGFloat = 0
        
        for element in elements {
            element.frame.origin.y = y
            element.frame.size.width = frame.width
            element.frame.size.height = element.heightInTableView()
            y = element.frame.maxY
        }
        
        contentSize = CGSize(width: frame.width, height: y)
    }
    
    /// Update layout for the given element in table view
    public func updateLayoutForElement(_ element: StaticTableViewElement) {
        var y: CGFloat = 0
        
        for item in elements {
            item.frame.origin.y = y
            if item === element {
                item.frame.size.height = item.heightInTableView()
            }
            y = item.frame.maxY
        }
        
        contentSize = CGSize(width: frame.width, height: y)
    }
    
    @objc func tableViewTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self)
        guard let cell = cellAtPoint(point) else { return }
        cell.didSelectAction?()
    }
    
    func cellAtPoint(_ point: CGPoint) -> StaticTableViewCell? {
        // check if point out of bounds
        if point.y > contentSize.height {
            return nil
        }
        // check cell for point. use binary search is better
        for cell in cells where cell.frame.contains(point) {
            return cell
        }
        return nil
    }
}
