//
//  DesignView.swift
//  bakeapp
//
//  Created by Lamia Aldossari on 16/03/2023.
//

import Foundation
import UIKit

@IBDesignable class DesignView : UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 7
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    @IBInspectable var shadowOffSetwidth : Int = 0
    @IBInspectable var shadow0ffSetHeight : Int = 0
    @IBInspectable var shadowOpacity: Float = 0.1

   
    override func layoutSubviews () {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetwidth, height: shadow0ffSetHeight)
        let shadowPath = UIBezierPath (roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}
