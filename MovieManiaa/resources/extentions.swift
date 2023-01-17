//
//  extentions.swift
//  netflixClone
//
//  Created by Waseem Ali on 30/11/2022.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() ->String{
            
        return self.prefix(1).uppercased()+self.lowercased().dropFirst();
    }
}
