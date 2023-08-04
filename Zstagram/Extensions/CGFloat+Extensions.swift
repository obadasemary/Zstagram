//
//  CGFloat+Extensions.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 4.08.2023.
//

import SwiftUI

extension CGFloat {
    static func imageDimension() -> CGFloat {
        (UIScreen.main.bounds.width / 3) - 1
    }
}
