//
//  image.swift
//  NeuroSpark
//
//  Created by salchug on 21.05.25.
//

import UIKit

extension UIImage {
    func circularImage(size: CGSize) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: size))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = size.height / 2
        imageView.layer.masksToBounds = true
        
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
