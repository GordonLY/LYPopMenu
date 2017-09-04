# LYPopMenu

###简单的弹出式菜单选择器
提供全UI定制(style类中提供几乎所有可定制的样式)

### Pod支持：
支持pod：  pod 'LYPopMenu', '~> 1.0'

### 效果图

| styles |
|---|
|![1](https://github.com/GordonLY/LYPopMenu/blob/master/screenshot/style1.png) | ![3](https://github.com/GordonLY/LYPopMenu/blob/master/screenshot/style3.png) | ![5](https://github.com/GordonLY/LYPopMenu/blob/master/screenshot/style5.png) |


### 参数说明图
    ![image](https://github.com/GordonLY/LYPopMenu/blob/master/screenshot/param1.png)
    ![image](https://github.com/GordonLY/LYPopMenu/blob/master/screenshot/param2.png)

### 用法示例
    /// models
    for idx in 0...3 {
        let model = LYPopMenuModel()
        model.title = "标题\(idx)"
        model.imageName = "popmenu_icon"
        items.append(model)
    }
    /// 使用models 和 style创建view
    menuView = LYPopMenuView.init(sender: sender, style: LYPopMenuStyle(), items: items)
    /// block 回调
    menuView?.action = {
        print("==== action click >>>\($0)")
    }
