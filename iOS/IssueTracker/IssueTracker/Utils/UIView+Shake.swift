//
//  UIView+Shake.swift
//  IssueTracker
//
//  Created by woong on 2020/11/11.
//

import UIKit.UIView

extension UIView {
    func shake(count : Float = 2,for duration : TimeInterval = 0.15,withTranslation translation : Float = 5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
