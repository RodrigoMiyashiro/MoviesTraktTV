//
//  Spinner.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 14/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class Spinner: NSObject
{
    struct ActivitySize {
        static let height : CGFloat = 60.0
        static let width : CGFloat = 60.0
    }
    static var viewActivity : UIView?
    static var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    private static func createSppiner(view: UIView) -> UIView
    {
//        let frame = CGRect(x: view.center.x - (ActivitySize.width/2), y: view.center.y - (ActivitySize.height/2), width: ActivitySize.width, height: ActivitySize.height)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }

    static func show(view:UIView)
    {
        let mainView = UIApplication.shared.keyWindow!.rootViewController!.view!
        
        viewActivity = UIView(frame: CGRect(x: mainView.frame.origin.x, y: mainView.frame.origin.y, width: mainView.frame.width, height: mainView.frame.height))
        viewActivity!.backgroundColor = UIColor.lightGray
        viewActivity!.center = view.center
        view.addSubview(viewActivity!)

        self.activityIndicator = createSppiner(view: view) as! UIActivityIndicatorView
    }
    
    static func stopAnimating()
    {
        self.viewActivity?.isHidden = true
        self.activityIndicator.stopAnimating()
        viewActivity?.removeFromSuperview()
    }
}
