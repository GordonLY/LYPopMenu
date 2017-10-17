//
//  UIView+Rect.swift
//  LY
//
//  Created by 李扬 on 2017/8/31.
//  Copyright © 2017年 李扬. All rights reserved.
//


import UIKit

extension UIView {
    
    // x
    var ly_x : CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    // y
    var ly_y : CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    // height
    var ly_height : CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var ly_width : CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    // left
    var ly_left : CGFloat {
        
        get {
            
            return ly_x
        }
        
        set(newVal) {
            
            ly_x = newVal
        }
    }
    
    // right
    var ly_right : CGFloat {
        
        get {
            
            return ly_x + ly_width
        }
        
        set(newVal) {
            
            ly_x = newVal - ly_width
        }
    }
    
    // top
    var ly_top : CGFloat {
        
        get {
            
            return ly_y
        }
        
        set(newVal) {
            
            ly_y = newVal
        }
    }
    
    // bottom
    var ly_bottom : CGFloat {
        
        get {
            
            return ly_y + ly_height
        }
        
        set(newVal) {
            
            ly_y = newVal - ly_height
        }
    }
    
    var ly_centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var ly_centerY : CGFloat {
        
        get {
            
            return center.y
        }
        
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var ly_b_center: CGPoint {
        get {
            return CGPoint.init(x: ly_middleX, y: ly_middleY)
        }
    }
    
    
    var ly_middleX : CGFloat {
        get {
            return ly_width / 2
        }
    }
    
    var ly_middleY : CGFloat {
        get {
            return ly_height / 2
        }
    }
    
    var ly_middlePoint : CGPoint {
        get {
            return CGPoint(x: ly_middleX, y: ly_middleY)
        }
    }
    var ly_origin: CGPoint  {
        get {
            return self.frame.origin
        }
        set(newVal) {
            var rect = self.frame
            rect.origin = newVal
            self.frame = rect
        }
    }
    
    var ly_size: CGSize  {
        get {
            return self.frame.size
        }
        set(newVal) {
            var rect = self.frame
            rect.size = newVal
            self.frame = rect
        }
    }
    
}
