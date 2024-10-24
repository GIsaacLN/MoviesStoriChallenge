//
//  FontExtension.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 23/10/24.
//

import SwiftUI
import UIKit

extension Font {
    static var customTitle: Font {
        return .custom("Oswald-Regular_Bold", size: 28, relativeTo: .title)
    }
    
    static var customTitle2: Font {
        return .custom("Oswald-Regular_Medium", size: 20, relativeTo: .title3)
    }
    
    static var customRating: Font {
        return .custom("Oswald-Regular_Bold", size: 24, relativeTo: .title2)
    }
    
    static var customBody: Font {
        return .custom("Roboto-Regular", size: 17, relativeTo: .body)
    }
    
    static var customCaption: Font {
        return .custom("Oswald-Regular", size: 12, relativeTo: .caption)
    }
}

extension UIFont {
    static var customTitle: UIFont {
        return UIFont(name: "Oswald-Regular_Bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .bold)
    }
    
    static var customTitle2: UIFont {
        return UIFont(name: "Oswald-Regular_Medium", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    static var customRating: UIFont {
        return UIFont(name: "Oswald-Regular_Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    static var customBody: UIFont {
        return UIFont(name: "Roboto-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    static var customCaption: UIFont {
        return UIFont(name: "Oswald-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    }
}

