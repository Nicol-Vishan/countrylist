//
//  UIImage+String.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 22/06/23.
//

import Foundation
import UIKit

extension UIImageView {

    func designFlag() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    func loadImage(url:URL){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
