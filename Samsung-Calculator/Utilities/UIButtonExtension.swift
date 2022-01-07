//
//  UIButtonExtension.swift
//  Samsung-Calculator
//
//  Created by Nicolas Famularo on 07/01/2022.
//

import UIKit

extension UIButton {

    func round(){
        layer.cornerRadius = bounds.height / 3
        clipsToBounds = true
    }
    
    func shine(){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
