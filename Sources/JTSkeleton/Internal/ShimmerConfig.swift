//
//  ShimmerConfig.swift
//  CommonSwiftUI
//
//  Created by James Thang on 31/05/2024.
//

import SwiftUI

struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat
    var highlightOpacity: CGFloat
    var speed: CGFloat
    var redacted: Bool
    
    init(tint: Color, highlight: Color, blur: CGFloat = 0, highlightOpacity: CGFloat = 1, speed: CGFloat = 2, redacted: Bool = false) {
        self.tint = tint
        self.highlight = highlight
        self.blur = blur
        self.highlightOpacity = highlightOpacity
        self.speed = speed
        self.redacted = redacted
    }
}
