//
//  AppStyle.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class AppStyle {
    private init() {}
}

extension AppStyle {

    enum ScreenType {
        case main, top, animation

        var color: UIColor {
            switch self {
            case .main: return Color.violet.value
            case .top: return Color.turquoise.value
            case .animation: return Color.blue.value
            }
        }
        
        var title: String {
            switch self {
            case .main: return "Главная"
            case .top: return "Топ"
            case .animation: return "Анимация"
            }
        }
    }

    enum NavigationBarButton: String {
        case back = "arrow_back"
        case info = "info-circle-fill"
        case top = "top_navigation_icon"
        case add = "ic_baseline-post-add"
        case choose = ""
        
        var icon: UIImage? {
            return UIImage(named: rawValue)
        }
        
        var title: String {
            switch self {
            case .choose: return "Выбрать"
            default: return ""
            }
        }
    }
    
}


// MARK: - Colors

extension AppStyle {
    
    enum Color {
        case violet
        case turquoise
        case blue
        case darkBlue
        case black

        var value: UIColor {
            switch self {
            
            case .violet: return #colorLiteral(red: 0.4380039573, green: 0.4293600321, blue: 0.858445704, alpha: 1)
            case .turquoise: return #colorLiteral(red: 0.5085753798, green: 0.789470017, blue: 0.8857402802, alpha: 1)
            case .blue: return #colorLiteral(red: 0.1780565977, green: 0.4229450822, blue: 0.851770401, alpha: 1)
            case .darkBlue: return #colorLiteral(red: 0.191531688, green: 0.2588540912, blue: 0.3403740525, alpha: 1)
            case .black: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
}

// MARK: - Fonts

extension AppStyle {

    static func font(_ font: AppStyle.Font, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: font.name, size: size) else {
            fatalError("")
        }
        return font
    }

}

extension AppStyle {

    enum Font {
        case helveticaNeue(_ weight: Weight)

        var name: String {
            switch self {
            case .helveticaNeue(let w):
                return "HelveticaNeue" + (w == .regular ? "" : w.name)
            }
        }

        static func get(_ font: AppStyle.Font, size: CGFloat) -> UIFont {
            guard let font = UIFont(name: font.name, size: size) else {
                fatalError("")
            }
            return font
        }
    }

}

extension AppStyle.Font {

    enum Weight {
        case regular
        case medium
        case semibold
        case bold
        case light
    }

}

extension AppStyle.Font.Weight {

    var name: String {
        switch self {
        case .regular: return "-Regular"
        case .medium: return "-Medium"
        case .semibold: return "-Semibold"
        case .bold: return "-Bold"
        case .light: return "-Light"
        }
    }

}
