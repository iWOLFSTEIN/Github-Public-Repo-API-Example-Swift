//
//  BaseViewController.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 08/05/2023.
//

import UIKit

//func showActivityIndicator() {
//    activityIndicatorView = UIView(frame: self.view.bounds)
//    activityIndicatorView?.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
//    let activityIndicator = UIActivityIndicatorView(style: .large)
//    activityIndicator.center = activityIndicatorView!.center
//    activityIndicator.startAnimating()
//    activityIndicatorView?.addSubview(activityIndicator)
//    self.view.addSubview(activityIndicatorView!)
//}
//
//func hideActivityIndicator() {
//    activityIndicatorView?.removeFromSuperview()
//    activityIndicatorView = nil
//}

extension UIViewController {

    var activityIndicatorView: UIView?

    func showActivityIndicator() {
        activityIndicatorView = UIView(frame: self.view.bounds)
        activityIndicatorView?.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityIndicatorView!.center
        activityIndicator.startAnimating()
        activityIndicatorView?.addSubview(activityIndicator)
        self.view.addSubview(activityIndicatorView!)
    }

    func hideActivityIndicator() {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil
    }
}

