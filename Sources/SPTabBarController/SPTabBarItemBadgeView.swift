//
//  File.swift
//  
//
//  Created by 宋璞 on 2023/5/19.
//

import UIKit

open class SPTabBarItemBadgeView: UIView {
    /// 默认颜色
    public static var defaultBadgeColor = UIColor(red: 255.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    
    /// Badge color
    open var badgeColor: UIColor? = defaultBadgeColor {
        didSet {
            imageView.backgroundColor = backgroundColor
        }
    }
    
    /// Badge value, supprot nil, "", "1", "someText". Hidden when nil. Show Little dot style when "".
    open var badgeValue: String? {
        didSet {
            badgeLabel.text = badgeValue
        }
    }
    
    /// Image view
    open var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: .zero)
        imageView.backgroundColor = .clear
        return imageView
    }()
    /// 显示badgeValue的Label
    open var badgeLabel: UILabel = {
        let badegLabel = UILabel.init(frame: .zero)
        badegLabel.backgroundColor = .clear
        badegLabel.textColor = .white
        badegLabel.font = UIFont.systemFont(ofSize: 13.0)
        badegLabel.textAlignment = .center
        return badegLabel
    }()
    
    // MARK: - Initialize
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(badgeLabel)
        self.imageView.backgroundColor = badgeColor
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// 通过layoutSubviews()布局子视图，你可以通过重写此方法实现自定义布局。
    open override func layoutSubviews() {
        super.layoutSubviews()
        guard let badgeValue = badgeValue else {
            imageView.isHidden = true
            badgeLabel.isHidden = true
            return
        }
        
        imageView.isHidden = false
        badgeLabel.isHidden = false
        
        if badgeValue == "" {
            imageView.frame = CGRect.init(origin: CGPoint.init(x: (bounds.size.width - 8.0) / 2.0, y: (bounds.size.height - 8.0) / 2.0), size: CGSize.init(width: 8.0, height: 8.0))
        } else {
            imageView.frame = bounds
        }
        
        imageView.layer.cornerRadius = imageView.bounds.size.height / 2.0
        badgeLabel.sizeToFit()
        badgeLabel.center = imageView.center
    }
    
    /*
     *  通过此方法计算badge视图需要占用父视图的frame大小，通过重写此方法可以自定义badge视图的大小。
     *  如果你需要自定义badge视图在Content中的位置，可以设置Content的badgeOffset属性。
     */
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let _ = badgeValue else {
            return CGSize.init(width: 18, height: 18)
        }
        let textSize = badgeLabel.sizeThatFits(CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        return CGSize.init(width: max(18.0, textSize.width + 10), height: 18)
    }
}
