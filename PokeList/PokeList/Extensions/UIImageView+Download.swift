//
//  UIImageView+Download.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

public extension UIImageView {
    
    func setImage(with url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            
        }.resume()
    }
}
