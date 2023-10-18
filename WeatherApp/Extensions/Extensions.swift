//
//  Extensions.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 13/10/23.
//
//Toast and Indicator refereed by Jaydeep
import Foundation


import UIKit
import TinyConstraints
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else { return }
        let resource = KF.ImageResource(downloadURL: url)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}

extension UIFont {
    static func robotoSlabMedium(size: CGFloat) -> UIFont? {
        return UIFont(name: "RobotoSlab-Medium", size: size)
    }
    static func robotoSlabLight(size: CGFloat) -> UIFont? {
        return UIFont(name: "RobotoSlab-Light", size: size)
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                                    CGRect(x: 285, y: 5, width: 20, height: 20))
       iconView.image = image

       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
}

extension UILabel {
    func applyShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

extension UIImageView {
    func applyShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

extension UIButton {
    func applyShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

extension UIViewController {
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-150, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showIndicator() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismissIndicator() {
        dismiss(animated: false, completion: nil)
    }
}
