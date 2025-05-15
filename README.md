# JTSkeleton

[![Pod Platform](http://img.shields.io/cocoapods/p/SDWebImage.svg?style=flat)](http://cocoadocs.org/docsets/SDWebImage/)
[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](https://cocoapods.org/pods/Tutorials)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Requirements](#requirements)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Author](#author)

## Overview
Skeleton loading is a popular pattern for improving perceived performance by showing placeholders that mimic content layout during loading. While SwiftUI doesn’t support this out of the box, this SDK makes it easy to add skeleton views to any SwiftUI interface.

<img src="https://github.com/user-attachments/assets/54483b59-5b6d-4c1c-b6ae-fd84aa7a3ed7" width="220">
<img src="https://github.com/user-attachments/assets/7838a97d-4acf-4019-b846-779ed34e5953" width="220">
<img src="https://github.com/user-attachments/assets/83007e7a-a269-4c67-889d-02eeb9e3f326" width="220">

With minimal setup, you can display animated or static placeholders that blend seamlessly into your design—improving user experience during data fetches or slow content loads.

## Features

- **ShimmerView**: A ready-to-use view that displays animated shimmering placeholders, perfect for representing loading content with minimal setup.

- **.shimmer**: A flexible modifier that applies the shimmer effect to any SwiftUI view, allowing full customization of layout, shape, and animation.

## Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS      | 15.0            |
| macOS    | 14.0            |
| tvOS     | 17.0            |
| watchOS  | 10.0            |
| visionOS |  1.0            |

## Installation

### Swift Package Manager

1. Open your project in Xcode.
2. Navigate to `File` > `Swift Packages` > `Add Package Dependency`.
3. Paste the repository URL: `https://github.com/Enryun/JTSkeleton`
4. Follow the prompts to add the package to your project.

For more details on using Swift Package Manager, visit [Apple's Swift Package Manager documentation](https://swift.org/package-manager/).


## Usage

## Shimmer View

A view displaying a shimmering loading placeholder.

```swift
ShimmerView()
```

This view simulates a 'shimmer' effect commonly used as a placeholder during content loading. It consists of multiple shimmering elements: a pair of small circular views at the top and bottom, and larger rectangular views in between, all showcasing the shimmer effect.

`iOS`:

https://github.com/user-attachments/assets/8f921028-2d13-4ed6-9281-998a883fe53e

`MacOS`:

https://github.com/user-attachments/assets/22f70fbf-d63d-4b06-994b-3b4b1b53415c

No additional configuration is needed. The shimmer effect starts automatically, simulating content loading in your UI.

Visibility: 
- Manage the visibility using `.opacity()` modifier or `if-else` conditions based on your application's state. This helps integrate the indicator seamlessly into your UI or hide it when not needed.

For more customization, look at the view modifier to apply a shimmer effect to any SwiftUI view.

## Shimmer View Modifier

Applies a shimmer effect to any SwiftUI view, enhancing the UI with a dynamic loading indicator.

```swift
Text("Loading...")
   .shimmer(isActive: $isShimmer, tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)

Text("Loading...")
   .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: false)
```

Parameters:
- `isActive`: A `Binding<Bool>` that controls whether the shimmer effect is active.
- `tint`: The background color of the shimmer.
- `highlight`: The color of the shimmering highlight.
- `blur`: The amount of blur applied to the shimmer effect. Default is 0.
- `highlightOpacity`: The opacity of the shimmer highlight. Default is 1.
- `speed`: The speed of the shimmer effect. Default is case .medium for 2 second.
- `redacted`: A Boolean value that indicates whether the view's content should be redacted during the shimmer effect. Default is false.

This function overlays a shimmer animation over the view it modifies, typically used as a placeholder during content loading. The effect can be extensively customized to match your app's style.

Example loading redacted and non-redacted:

```swift
VStack {
    HStack {
        Circle()
            .frame(width: 55, height: 55)
        
        VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 4)
                .frame(height: 10)
            
            RoundedRectangle(cornerRadius: 4)
                .frame(height: 10)
                .padding(.trailing, 50)
            
            RoundedRectangle(cornerRadius: 4)
                .frame(height: 10)
                .padding(.trailing, 100)
        }
    }
    .padding(15)
    .padding(.horizontal, 30)
    .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)
    
    Text("Loading...")
        .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: false)
}
```

https://github.com/user-attachments/assets/731719e0-7e23-4e56-8a4f-c86c81cc0b13

Example loading with `Binding` isActive to control loading:

```swift
@State private var isShimmer = true

var body: some View {
    VStack {
        HStack {
            Circle()
                .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                    .padding(.trailing, 50)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                    .padding(.trailing, 100)
            }
        }
        .padding(15)
        .padding(.horizontal, 30)
        .shimmer(isActive: $isShimmer, tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)
        
        Text("Loading...")
            .fontWeight(.semibold)
            .shimmer(isActive: $isShimmer, tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: false)
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isShimmer = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isShimmer = true
        }
    }
}
```

https://github.com/user-attachments/assets/fffd83e9-6a8e-4604-b6c7-4ba46308f662

Customize the parameters to fit the style of your app's loading indicators.

## Author

James Thang, find me on [LinkedIn](https://www.linkedin.com/in/jamesthang/)

Learn more about SwiftUI, check out my book :books: on [Amazon](https://www.amazon.com/Ultimate-SwiftUI-Handbook-iOS-Developers-ebook/dp/B0CKBVY7V6/ref=tmm_kin_swatch_0?_encoding=UTF8&qid=1696776124&sr=8-1)
