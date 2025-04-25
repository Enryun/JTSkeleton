## Shimmer View

A view displaying a shimmering loading placeholder.

```swift
ShimmerView()
```

This view simulates a 'shimmer' effect commonly used as a placeholder during content loading. It consists of multiple shimmering elements: a pair of small circular views at the top and bottom, and larger rectangular views in between, all showcasing the shimmer effect.

https://github.com/user-attachments/assets/8f921028-2d13-4ed6-9281-998a883fe53e

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
