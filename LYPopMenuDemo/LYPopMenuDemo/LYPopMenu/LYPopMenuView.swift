//
//  LYPopMenuView.swift
//  LYPopMenuDemo
//
//  Created by Gordon on 2017/8/31.
//  Copyright © 2017年 Gordon. All rights reserved.
//

import UIKit

class LYPopMenuView: UIView {
    
    /// action callback
    var action: ((String) -> Void)?
    var showComplete: (() -> Void)?
    var hideComplete: (() -> Void)?
    
    fileprivate let menuView = UIView()
    
    fileprivate var sender: UIView
    fileprivate var style: LYPopMenuStyle
    fileprivate var items: [LYPopMenuModel]
    
    init(sender: UIView, style: LYPopMenuStyle, items: [LYPopMenuModel]) {
        self.sender = sender
        self.style = style
        self.items = items
        super.init(frame: UIScreen.main.bounds)
        self.p_initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LYPopMenuView {
    func show() {
        guard self.superview == nil,let window = UIApplication.shared.keyWindow else { return }
        window.addSubview(self)
        self.alpha = 0
        menuView.alpha = 0
        menuView.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1
            self.menuView.alpha = 1
            self.menuView.transform = .identity
        }) { _ in
            if let showComplete = self.showComplete {
                showComplete()
            }
        }
    }
    func hide() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
            self.menuView.alpha = 0
            self.menuView.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        }) { _ in
            self.removeFromSuperview()
            if let hideComplete = self.hideComplete {
                hideComplete()
            }
        }
    }
    func actionSelectItem(title: String) {
        if let action = action {
            action(title)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.hide()
    }
}


extension LYPopMenuView {
    fileprivate func p_initSubviews() {
        self.backgroundColor = style.coverColor
        
        let menu_h = style.cellHeight * CGFloat(items.count) + style.menuArrowHeight
        let menu_y = sender.ly_bottom
        let menu_w = style.menuWidth
        var menu_x = sender.ly_centerX - (menu_w * 0.5)
        let min_x:CGFloat = 5
        let max_x = self.ly_width - menu_w - 5
        if menu_x < min_x {
            menu_x = min_x
        } else if menu_x > max_x {
            menu_x = max_x
        }
        
        menuView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
        menuView.frame = CGRect.init(x: menu_x, y: menu_y, width: menu_w, height: menu_h)
        self.addSubview(menuView)
        self.p_drawTriangleLayer()
        self.p_initMenuCells()
    }
    private func p_initMenuCells() {
        
        let cell_w = menuView.ly_width
        let cell_h = style.cellHeight
        let ori_y = style.menuArrowHeight
        
        let contentView = UIView.init(frame: CGRect.init(x: 0, y: ori_y, width: cell_w, height: menuView.ly_height - ori_y))
        contentView.backgroundColor = style.menuBgColor
        contentView.layer.cornerRadius = style.menuCorner
        contentView.layer.masksToBounds = true
        menuView.addSubview(contentView)
        
        for idx in 0 ..< items.count {
            let cell_y = cell_h * CGFloat(idx)
            let rect = CGRect.init(x: 0, y: cell_y, width: cell_w, height: cell_h)
            let cell = LYPopMenuCell.init(frame: rect, style: style)
            cell.itemModel = items[idx]
            cell.cellSelectAction = { [weak self] (title) in
                self?.actionSelectItem(title: title)
            }
            cell.separateLine.isHidden = (idx == items.count - 1)
            contentView.addSubview(cell)
        }
        
    }
    private func p_drawTriangleLayer() {
        guard menuView.frame != CGRect.zero else { return }
        let arrHei = style.menuArrowHeight
        let point_old = CGPoint.init(x: sender.ly_centerX, y: sender.ly_bottom)
        let point_top = self.convert(point_old, to: menuView)
        let point_left = CGPoint.init(x: point_top.x - arrHei * 0.5, y: point_top.y + arrHei)
        let point_right = CGPoint.init(x: point_top.x + arrHei * 0.5, y: point_left.y)
        let trigonPath = UIBezierPath()
        trigonPath.move(to: point_top)
        trigonPath.addLine(to: point_left)
        trigonPath.addLine(to: point_right)
        trigonPath.close()
        
        let triLayer = CAShapeLayer()
        triLayer.path = trigonPath.cgPath
        triLayer.fillColor = style.menuBgColor.cgColor
        menuView.layer.addSublayer(triLayer)
        
        let anchor_x = point_top.x / menuView.ly_width
        let pre_menuX = menuView.ly_left
        menuView.layer.anchorPoint = CGPoint.init(x: anchor_x, y: 0)
        menuView.ly_left = pre_menuX
    }
}




