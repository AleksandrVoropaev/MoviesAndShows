# MoviesAndShows

[![Swift Version](https://img.shields.io/badge/Swift-5.5-orange.svg)](https://swift.org/)
[![iOS Version](https://img.shields.io/badge/iOS-14+-blue.svg)](https://developer.apple.com/ios/)
[![Combine](https://img.shields.io/badge/Combine-Yes-green.svg)](https://developer.apple.com/documentation/combine)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-Yes-purple.svg)](https://developer.apple.com/xcode/swiftui/)
[![MVVM](https://img.shields.io/badge/Architecture-MVVM-yellow.svg)](https://en.wikipedia.org/wiki/Model–view–viewmodel)

Browse and explore movies and TV shows by genre using The Movie Database (TMDB) API.


## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [API Integration](#api-integration)
- [Contributing](#contributing)
- [License](#license)


## Features

- View a list of movies and TV shows categorized by genre.
- Select genres from a horizontal scroll list to reload the main vertical scroll view.
- Supports iOS 14+.
- Built using Swift and SwiftUI.
- Utilizes the Combine framework for reactive programming.
- Follows the MVVM architectural pattern.
- No external dependencies used.


## Screenshots

![Movies Screen](/Screenshots/movies_screen.png)
![TV Shows Screen](/Screenshots/tv_shows_screen.png)


## Getting Started

### Prerequisites

- Xcode 14.2 or later
- iOS 14+
- TMDB API key (replace with your own key)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/MoviesAndShows.git
```
2. Navigate to the project directory:
```bash
cd MoviesAndShows
```
3. Open the Xcode project file:
```bash
open MoviesAndShows.xcodeproj
```
4. In Xcode, navigate to Constants.swift and replace YOUR_TMDB_API_KEY with your actual TMDB API key.
5. Build and run the app using Xcode.


## Usage

- Launch the app on your iOS device or simulator.
- On the "Movies" or "TV Shows" screen, select a genre from the horizontal scroll list.
- The main vertical scroll view will reload with content based on the selected genre.


## Technologies Used

- Swift
- Combine
- SwiftUI


## API Integration

The app uses the [TMDB API](https://developer.themoviedb.org/docs) to fetch movies and TV shows data by genre. To use the app, you'll need to obtain an API key from TMDB and replace it in the `Config.swift` file.

```swift
//  /Sources/Constants.swift

enum Constant {
    static let apiKey = "YOUR_TMDB_API_KEY_GOES_HERE"
}
```

## Contributing

Contributions are welcome! If you'd like to contribute:

1. Fork the repository.
2. Create a new branch: git checkout -b feature/your-feature-name
3. Make your changes and commit them.
4. Push to your forked repository.
5. Submit a pull request.


## License

This project is licensed under the MIT License.
