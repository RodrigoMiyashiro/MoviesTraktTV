//
//  UIView.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 14/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIView
{
    func cornerRadius(radius: CGFloat)
    {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
