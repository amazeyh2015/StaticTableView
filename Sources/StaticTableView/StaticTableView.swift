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
        preservesSuperviewLayoutMargins = true
        backgroundColor = .systemBackground
        alwaysBounceVertical = true
        
        let tgr = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped(_:)))
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(tableViewLongPressed(_:)))
        addGestureRecognizer(tgr)
        addGestureRecognizer(lpgr)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateLayoutIfNeeded1()
    }
    
    /// Set sections for table view. This will automatically reset the elements by current sections.
    public var sections: [StaticTableViewSection] = [] {
        didSet {
            removeAllElements()
            addAllElements()
            updateLayoutIfNeeded2()
        }
    }
    
    var elements: [StaticTableViewElement] = []
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
    
    /// Record width for last layout
    var oldWidth: CGFloat = 0
    
    /// Used when layoutSubviews method invoked
    func updateLayoutIfNeeded1() {
        if frame.width == oldWidth {
            return
        }
        oldWidth = frame.width
        updateLayout()
    }
    
    /// Used when data source changed
    func updateLayoutIfNeeded2() {
        if frame.width == 0 {
            return
        }
        if superview == nil {
            return
        }
        updateLayout()
    }
    
    /// Update layout for all current element in table view
    public func updateLayout() {
        var y: CGFloat = 0
        
        for element in elements {
            element.frame.origin.y = y
            element.frame.size.width = frame.width
            element.frame.size.height = element.heightInTableView(self)
            y = element.frame.maxY
        }
        
        contentSize = CGSize(width: frame.width, height: y)
    }
    
    /// Update layout for the given element
    public func updateLayoutForElement(_ element: StaticTableViewElement) {
        var y: CGFloat = 0
        
        for item in elements {
            item.frame.origin.y = y
            if item === element {
                item.frame.size.height = item.heightInTableView(self)
            }
            y = item.frame.maxY
        }
        
        contentSize = CGSize(width: frame.width, height: y)
    }
    
    /// Update layout for the given elements
    public func updateLayoutForElements(_ elements: [StaticTableViewElement]) {
        var y: CGFloat = 0
        
        for element in elements {
            element.frame.origin.y = y
            if isElement(element, in: elements) {
                element.frame.size.height = element.heightInTableView(self)
            }
            y = element.frame.maxY
        }
        
        contentSize = CGSize(width: frame.width, height: y)
    }
    
    func isElement(_ element: StaticTableViewElement, in elements: [StaticTableViewElement]) -> Bool {
        for item in elements where item === element {
            return true
        }
        return false
    }
    
    @objc func tableViewTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self)
        guard let cell = cellAtPoint(point) else { return }
        cell.setSelected(true, animated: false)
        cell.didSelectAction?()
    }
    
    @objc func tableViewLongPressed(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self)
        guard let cell = cellAtPoint(point) else { return }
        let highlighted = sender.state == .began
        cell.setHighlighted(highlighted, animated: false)
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
