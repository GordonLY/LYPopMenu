//
//  LYPopMenuCell.swift
//  LYPopMenuDemo
//
//  Created by Gordon on 2017/8/31.
//  Copyright © 2017年 Gordon. All rights reserved.
//

import UIKit

class LYPopMenuCell: UIView {

    var cellSelectAction: ((String) -> Void)?
    var itemModel = LYPopMenuModel() {
        didSet {
            if let imgName = itemModel.imageName {
                icon.image = UIImage.init(named: imgName)
            }
            titleLabel.text = itemModel.title
        }
    }
    let separateLine = UIView()
    private var bgBtn: LYButton!
    private var icon: UIImageView!
    private var titleLabel: UILabel!
    private var style: LYPopMenuStyle
    init(frame:CGRect, style: LYPopMenuStyle) {
        self.style = style
        super.init(frame: frame)
        self.p_initSubviews()
    }
    @objc fileprivate func actionBtnClick() {
        if let action = cellSelectAction {
            action(titleLabel.text ?? "")
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LYPopMenuCell {
    fileprivate func p_initSubviews() {
        
        self.layer.masksToBounds = true
        
        bgBtn = LYButton.init(frame: self.bounds)
        bgBtn.backgroundColor = style.menuBgColor
        bgBtn.normalBgColor = style.menuBgColor
        bgBtn.highLightBgColor = style.cellHighlightColor
        bgBtn.addTarget(self, action: #selector(actionBtnClick), for: .touchUpInside)
        self.addSubview(bgBtn)
        
        icon = UIImageView.init(frame: style.iconFrame)
        icon.contentMode = .center
        bgBtn.addSubview(icon)
        
        titleLabel = UILabel.init(frame: style.titleFrame)
        titleLabel.font = style.titleFont
        titleLabel.textColor = style.titleColor
        bgBtn.addSubview(titleLabel)
        
        separateLine.frame = CGRect.init(x: style.separateMargin.left, y: self.ly_height - 0.5, width: self.ly_width - style.separateMargin.left - style.separateMargin.right, height: 0.5)
        separateLine.backgroundColor = style.separateColor
        self.addSubview(separateLine)
    }
}

fileprivate class LYButton: UIButton {
    
    var highLightBgColor = UIColor.init(red: 217.0/255, green: 217.0/255, blue: 217.0/255, alpha: 1)
    var normalBgColor = UIColor.white
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = highLightBgColor
            } else {
                self.backgroundColor = normalBgColor
            }
        }
    }
}
