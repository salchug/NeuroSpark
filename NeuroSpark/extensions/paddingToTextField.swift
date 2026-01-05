//
//  paddingToTextField.swift
//  NeuroSpark
//
//  Created by salchug on 12.05.25.
//

import UIKit

extension UITextField {
    
    func setPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let leftPadding = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        
        if let rightPadding = right {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

