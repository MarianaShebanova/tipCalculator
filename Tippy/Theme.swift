//
//  Theme.swift
//  Tippy
//
//  Created by mariana on 3/5/17.
//  Copyright © 2017 mariana. All rights reserved.
//

import UIKit

enum Theme: Int {
    case LIGHT, DARK
    
    var mainColor: UIColor {
        switch self {
        case .LIGHT:
            return UIColor(red: 0.0/255.0, green: 120.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        case .DARK:
            return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
        
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .LIGHT:
            return .default
        case .DARK:
            return .black
        }
    }
    
}

struct ThemeManager {
    
    static func currentTheme() -> Theme {
        UserDefaults.standard.value(forKeyPath: "default_theme_index")
        if let storedTheme = (UserDefaults.standard.value(forKey: "default_theme_index") as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .LIGHT
        }
    }
    
    static func getTheme(theme: Int) -> Theme {
        return Theme(rawValue: theme)!
    }
    
    static func applyTheme(theme: Theme) {        
        UIApplication.shared.delegate?.window??.tintColor = theme.mainColor
        UINavigationBar.appearance().barStyle = theme.barStyle
        UITabBar.appearance().barStyle = theme.barStyle
        UILabel.appearance().textColor = theme.mainColor
    }
}
