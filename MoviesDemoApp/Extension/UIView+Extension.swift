//
//  UIView+Extension.swift
//  MoviesDemoApp
//
//  Created by karma on 9/22/22.
//

import UIKit

extension UIView {
    
    var width: CGFloat{
           return frame.size.width
       }
       
       var height: CGFloat{
           return frame.size.height
       }
       
       var left: CGFloat{
           return frame.origin.x
       }
       
       var right: CGFloat{
           return left + width
       }
       
       var top: CGFloat{
           return frame.origin.y
       }
       
       var bottom: CGFloat {
           return top + height
       }
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.isHidden = true
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func hideWithAnimation(hidden: Bool) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
    }
    
    func set(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }

}
