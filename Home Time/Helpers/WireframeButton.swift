//
//  WireframButton.swift
//  pocketKPI
//
//  Created by Jason van Lint on 12/11/15.
//  Copyright © 2015 Dead Frog Studios. All rights reserved.
//

import UIKit

///  Subclass of UIButton that creates a wire framed button with adjustable border colors and widths along with adjustable corner radius.
///
/// - Remark: Uses IBDesignable and IBInpectable key words to enable use in Storyboards and attribute settings in the properties panel.
@IBDesignable
public class WireFrameButton: UIButton {
        
    @IBInspectable
    var borderColor = UIColor.white {
        didSet {
            layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        self.clipsToBounds = true
        if self.cornerRadius == 0 {
            layer.cornerRadius = 0.5 * self.bounds.height
        } else {
            layer.cornerRadius = self.cornerRadius
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.updateCornerRadius()
    }
}
