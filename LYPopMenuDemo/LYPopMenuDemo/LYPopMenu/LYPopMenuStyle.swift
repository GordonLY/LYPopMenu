//
//  LYPopMenuStyle.swift
//  DLPopMenuDemo
//
//  Created by Gordon on 2017/8/31.
//  Copyright © 2017年 Gordon. All rights reserved.
//

import UIKit

struct LYPopMenuStyle {

    
    init() {
        self.p_refreshStyle()
    }
    
    /// 屏幕遮罩背景色
    var coverColor = UIColor.init(white: 0, alpha: 0.6)
    
    /// 菜单的背景色
    var menuBgColor = UIColor.white
    /// 菜单的圆角
    var menuCorner: CGFloat = 2
    /// 菜单cell的width
    var menuWidth: CGFloat = 120 {
        didSet {
            self.p_refreshStyle()
        }
    }
    /// 菜单cell的height
    var cellHeight: CGFloat = 40 {
        didSet {
            self.p_refreshStyle()
        }
    }
    /// 菜单cell选中后的颜色
    var cellHighlightColor = UIColor.init(red: 217.0/255, green: 217.0/255, blue: 217.0/255, alpha: 1)
    
    /// 菜单小箭头的高度
    var menuArrowHeight:CGFloat = 8
    /// 小图标的frame
    var iconFrame = CGRect.zero
    /// 小图标和文本之间的间距 (设置后，titleFrame无效)
    var space: CGFloat = 0 {
        didSet {
            self.p_refreshStyle()
        }
    }
    /// 文字的frame (设置后，space无效)
    var titleFrame = CGRect.zero
    /// 文字颜色
    var titleColor = UIColor.black
    /// 文字字体
    var titleFont = UIFont.systemFont(ofSize: 14)
    
    /// 分割线的左右的margin
    var separateMargin: (left: CGFloat, right: CGFloat) = (0,0)
    var separateColor = UIColor.init(red: 221.0/255, green: 221.0/255, blue: 221.0/255, alpha: 1)
    
    /// autoHide
    var isAutoHide = true
    
    private mutating func p_refreshStyle() {
        iconFrame = CGRect.init(x: 0, y: 0, width: cellHeight, height: cellHeight)
        titleFrame = CGRect.init(x: iconFrame.maxX + space, y: 0, width: menuWidth - iconFrame.maxX, height: cellHeight)
    }
}
