# Weather App 🌤️

### A Flutter-based weather application that provides real-time weather information using WeatherAPI.

## Features ✨

- **Real-time Weather Data**: Displays the current weather conditions based on your location.
- **Hourly and Daily Forecasts**: Get detailed weather forecasts for the upcoming hours and days.
- **Location-Based Weather**: Automatically fetches weather data based on the user's location using GPS.
- **Clean and Simple UI**: User-friendly interface with clear weather information.
  
## Screenshots 📱

| Home Screen |   Home Screen  |
|-------------|----------------|
| <p align="center"> <img src="https://github.com/user-attachments/assets/21a7386f-292b-485c-aa9f-3c4399136c52" width="34%" height="34%" align=”middle”></p> | <p align="center"><video src="https://github.com/user-attachments/assets/342bf5fd-50b0-4839-b4ce-1ab8755083c0"  ></p> |




## Getting Started 🚀


### Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK installed: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A free API key from [Here](https://www.weatherapi.com/) to get weather data.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AhmedAlboishe/weather-app.git
   ```
2. Navigate to the project directory:

   ```bash
   cd weather-app
   ```
   
3. Install the dependencies:
   
   ```bash
   flutter pub get
   ```
4. Run the application:

   ```bash
   flutter run
   ```

### Environment Setup

To run the app, you'll need an API key from **https://www.weatherapi.com**. Follow these steps to add your API key:

1. Sign up on **https://www.weatherapi.com** and obtain your API key.
2. Open the `lib/core/services/weather_services.dart` file in the project.
3. Replace `YOUR_API_KEY` with your actual API key:

   ```dart
   const String apiKey = 'YOUR_API_KEY';
   ```

4. Save the file and restart the application.

### Permissions
The app requires location access to fetch weather data based on the user's current location. Make sure you handle the following permissions:

- Android: Ensure location permission is declared in AndroidManifest.xml.

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```
- iOS: Make sure the Info.plist file contains the required location permission settings.

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to provide weather updates.</string>
```

## How It Works 🔍

The application fetches weather data based on the user's current location. It uses the following components:

- **Geolocator**: To obtain the user's current location.
- **WeatherAPI**: To retrieve real-time weather data such as temperature, wind speed, and weather conditions for the location.
- **UI Components**: A simple and intuitive interface to display the weather information, including hourly and daily forecasts.

### Permissions

This weather application **relies entirely on location services** to provide accurate weather data based on the user's current location. **Manual search for locations is not supported**, so granting location permission is essential for the app to function properly.

If the user denies location permissions, they will be prompted to enable location access from their device settings. Without location access, the app cannot retrieve or display weather data.

## Packages Used 🛠️

- **get**.
- **geolocator**.
- **chart_sparkline**.
- **permission_handler**.
- **intl**.
- **gap**.
- **lottie**.
- **flutter_svg**.
