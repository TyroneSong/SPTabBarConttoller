//
//  ExampleTipsContentView.swift
//  SPTabBarControllerExample
//
//  Created by 宋璞 on 2023/5/22.
//

import UIKit

class ExampleTipsBasicContentView: ExampleBouncesContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 23/255.0, green: 149/255.0, blue: 158/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 23/255.0, green: 149/255.0, blue: 158/255.0, alpha: 1.0)
        backdropColor = UIColor.init(red: 10/255.0, green: 66/255.0, blue: 91/255.0, alpha: 1.0)
        highlightBackdropColor = UIColor.init(red: 10/255.0, green: 66/255.0, blue: 91/255.0, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ExampleTipsContentView: ExampleTipsBasicContentView {
    var tipsImageView: UIImageView = {
        let tipsImageView = UIImageView.init(image: UIImage.init(named: "tips")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 10, left: 10, bottom: 25, right: 25), resizingMode: UIImage.ResizingMode.stretch))
        return tipsImageView
    }()
    
    var tipsLabel: UILabel = {
        let tipsLabel = UILabel.init(frame: .zero)
        tipsLabel.text = "发现新版本"
        tipsLabel.font = UIFont.systemFont(ofSize: 14.0)
        tipsLabel.textColor = .white
        return tipsLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tipsImageView)
        self.addSubview(tipsLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tipsImageView.frame = CGRect.init(x: bounds.size.width - 92, y: -38, width: 92, height: 36)
        tipsLabel.sizeToFit()
        tipsLabel.center = CGPoint.init(x: tipsImageView.center.x, y: tipsImageView.center.y - 3)
    }
}
