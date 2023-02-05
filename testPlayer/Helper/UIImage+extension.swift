//
//  UIImage+extension.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import Foundation
import UIKit

//чтобы менять размер системных картинок
extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
