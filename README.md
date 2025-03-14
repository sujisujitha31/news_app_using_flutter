News App
A Flutter-based news application that fetches news data using an API, manages state with GetX, and uses the Dio package for API integration. The app also utilizes Google Fonts for text styling.

Features
API Integration: Fetches news data using the Dio package.

State Management: Uses GetX for efficient state management.

Styling: Utilizes Google Fonts for custom text styling.

Responsive Design: Works seamlessly on both Android and iOS devices.


Installation
To run this project locally, follow these steps:

Clone the repository:
git clone https://github.com/sujisujitha31/news_app_using_flutter/
cd news-app

Install dependencies:
Make sure you have Flutter installed. If not, follow the official Flutter installation guide.

Then, install the required dependencies:
flutter pub get

Run the app:
flutter run

Dependencies:
This project uses the following dependencies

Dio: For API integration.

GetX: For state management and navigation.

Google Fonts: For custom text styling.

SharedPreferences: For local storage

Flutter: The core framework.

To add these dependencies, ensure your pubspec.yaml file includes the above packages.




Approach to Building this application

1.UI Design
First, design the UI using Flutter widgets.
Ensure the layout is responsive and user-friendly.

2.API Request Setup
Create a separate file for handling API requests.
Define the base URL and implement methods for API calls using Dio.
Since we only need GET, implement only the getNews() method.

3.Install and Setup GetX
Install GetX for state management and navigation.
Create a HomeController to manage API calls and state.

4.Fetching News Data
Call the getNews() API inside HomeController.
Store the list of news articles in an observable variable.
Cache the fetched news in SharedPreferences for offline access.
Use update() method to refresh the UI dynamically.
If the internet is not available, show cached news from SharedPreferences.

5.UI Update with GetX
Use GetBuilder to update the UI dynamically based on the fetched news data.
