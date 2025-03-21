
# ARRuler

ARRuler is an iOS application that leverages Apple's ARKit to provide real-time distance measurements in augmented reality. By placing points in 3D space, users can quickly measure distances between objects in their physical environment.

## Screenshots

### 📏 Screenshots 1
![Measuring View](ar_measuring_view.png)

### 📐 Screenshots 2
![Distance Display](ar_distance_display.png)

## Features

- **Augmented Reality Measurement**: Measure distances in 3D space with high accuracy  
- **Simple Interface**: Tap to place measurement points  
- **Real-time Calculation**: Instantly see distance measurements  
- **Horizontal Plane Detection**: Automatically detects flat surfaces for accurate placement  
- **Visual Feedback**: Red dots indicate measurement points with distance displayed as text  

## Requirements

- iOS 17.0+  
- iPhone or iPad with A9 processor or newer (devices compatible with ARKit)  
- Xcode 15.0+  
- Swift 5.0+  

## Tech Stack

- **Swift** - Primary programming language  
- **ARKit** - Apple's augmented reality framework  
- **SceneKit** - 3D graphics rendering and animation  
- **UIKit** - User interface components  
- **Xcode** - Development environment  

## Installation

### Clone this repository
```bash
git clone https://github.com/yourusername/ARRuler.git
```

### Open the project in Xcode
```bash
cd ARRuler
open ARRuler.xcodeproj
```

- Select your development team in the **Signing & Capabilities** section  
- Build and run the application on your iOS device  

## Usage

1. Launch the app and move your device around to detect horizontal surfaces (feature points will appear)  
2. Tap on a detected surface to place the first measurement point (a red dot appears)  
3. Tap on another location to place the second measurement point  
4. The distance between the two points will be displayed in meters  
5. To start a new measurement, simply tap again to clear previous points and start over  

## How It Works

ARRuler uses ARKit's plane detection to identify surfaces in the real world. When the user taps on the screen:

- A ray cast is performed from the touch location into the AR scene  
- If the ray intersects with a detected plane, a dot is placed at that location  
- After two dots are placed, the app calculates the Euclidean distance in 3D space  
- The distance is displayed as a text node near the second point  

**The distance is calculated using the formula:**
```
distance = √((x₂-x₁)² + (y₂-y₁)² + (z₂-z₁)²)
```

## Contributing

Contributions to improve ARRuler are welcome. Feel free to fork the repository and submit pull requests.

## Future Enhancements

- Unit conversion (meters, feet, inches)  
- Save measurements with screenshots  
- Measure area and volume  
- Continuous measurement mode  
- Improved visual styling and user interface  
- Support for vertical surfaces  
