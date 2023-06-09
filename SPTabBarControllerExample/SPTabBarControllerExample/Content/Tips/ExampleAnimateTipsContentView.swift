//
//  ExampleAnimateTipsContentView.swift
//  SPTabBarControllerExample
//
//  Created by 宋璞 on 2023/5/22.
//

import UIKit

class ExampleAnimateTipsContentView: ExampleBackgroundContentView {
    
    var duration = 0.3
    
    override func badgeChangedAnimation(animated: Bool, completion: (() -> ())?) {
        super.badgeChangedAnimation(animated: animated, completion: completion)
        notificationAnimation()
    }
    
    func notificationAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        impliesAnimation.values = [0.0 ,-8.0, 4.0, -4.0, 3.0, -2.0, 0.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

class ExampleAnimateTipsContentView2: ExampleAnimateTipsContentView {
    
    
    override func notificationAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

class ExampleAnimateTipsContentView3: ExampleAnimateTipsContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        badgeColor = UIColor.clear
        badgeView.imageView.image = UIImage.init(named: "tips2")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 10, left: 10, bottom: 25, right: 25)).withRenderingMode(.alwaysTemplate)
        badgeView.tintColor = UIColor.lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
