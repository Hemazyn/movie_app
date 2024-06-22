# Movie App

## Table of Contents
- [Overview](#overview)
- [Preview](#preview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Public Info](#public-info)
- [Acknowledgment](#acknowledgments)

### Overview
The Movie App is a Flutter application that allows users to browse and search for movies. The app fetches data from the TVmaze API and displays movie information in a visually appealing manner. It leverages the http package for network requests, cached_network_image for efficient image loading, webview_flutter for displaying movie details, and cupertino_icons for a consistent icon set.

### Preview
![](/assets/images/movie1.png)
![](/assets/images/movie2.png)
![](/assets/images/movie3.png)
![](/assets/images/movie4.png)

### Features
- Browse popular movies
- Search for movies by title
- View detailed information about each movie
- Caching of images for better performance
- Responsive and intuitive user interface

### Installation
Prerequisites
- Flutter SDK: Install Flutter
- Dart: Comes pre-packaged with Flutter

Steps
1. Clone the repository:
```
git clone https://github.com/yourusername/movie_app.git
cd movie_app
```
2. Install dependencies:
```
flutter pub get
```
3. Run the app:
```
flutter run
```
Packages Used
- [http](https://pub.dev/packages/http): Used for making network requests to the TVmaze API.
- [cached_network_image](https://pub.dev/packages/cached_network_image): Used for efficient image loading and caching.
- [webview_flutter](https://pub.dev/packages/webview_flutter): Used for displaying detailed movie information in a web view.
- [cupertino_icons](https://pub.dev/packages/cupertino_icons): Provides a consistent set of icons for iOS style.


### Usage
- **Home Screen**
The home screen displays a list of popular movies. Scroll to see more movies. Tap a movie to view its details.

- **Search Functionality**
Use the search bar to find movies by title. The app will display a list of matching results.

- **Movie Details**
Tap on a movie to view detailed information, including a synopsis, cast, and other relevant details. Images are cached for better performance.

### Public Info
- Website - [Emmanuel Tofumi](https://devemma.netlify.app)
- Twitter - [@imanuel_tofunmi](https://twitter.com/imanuel_tofunmi)

### Acknowledgments
- Special thanks to the [flutter development team](https://flutter.dev/).
- Thanks to [TVmaze](https://www.tvmaze.com/) for providing the movie API.

Thank you for using Movie App! We hope this tool helps you in your projects. Happy coding!