//
//  FontExtension.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 02/09/25.
//

import SwiftUI

extension Font {
    // MARK: - Inter Fonts
    static func appRegular(_ size: CGFloat) -> Font {
        .custom("Inter-Regular", size: size)
    }
    static func appBold(_ size: CGFloat) -> Font {
        .custom("Inter-Bold", size: size)
    }
    static func appSemiBold(_ size: CGFloat) -> Font {
        .custom("Inter-SemiBold", size: size)
    }
    static func appMedium(_ size: CGFloat) -> Font {
        .custom("Inter-Medium", size: size)
    }

    // MARK: - DM Serif
    static func appDMSerifItalic(_ size: CGFloat) -> Font {
        .custom("DMSerifDisplay-Italic", size: size)
    }
    static func appDMSerifRegular(_ size: CGFloat) -> Font {
        .custom("DMSerifDisplay-Regular", size: size)
    }
}

