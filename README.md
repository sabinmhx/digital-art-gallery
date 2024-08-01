# Digital Art Gallery App

A modern, cross-platform digital art gallery application built with Flutter for the frontend and Express.js with MongoDB for the backend.

## 📱 Features

- Browse a curated collection of digital artworks
- Search and filter artworks by various criteria
- User authentication and personalized galleries
- Artist profiles and artwork details
- Like, comment, and share functionalities
- Responsive design for mobile and web platforms

## 🛠 Tech Stack

- **Frontend**: Flutter
- **Backend**: Express.js
- **Database**: MongoDB
- **Authentication**: JWT (JSON Web Tokens)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Node.js and npm
- MongoDB

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/sabinmhx/digital-art-gallery.git
   cd digital-art-gallery
   ```

2. Set up the backend:
   ```
   cd backend
   npm install
   cp .env.example .env
   # Update .env with your MongoDB connection string and JWT secret
   ```

3. Set up the Flutter frontend:
   ```
   cd ../digital_art_gallery_app
   flutter pub get
   ```

4. Run the backend server:
   ```
   cd ../digital_art_gallery_backend
   npm start
   ```

5. Run the Flutter app:
   ```
   cd ../digital_art_gallery_app
   flutter run
   ```

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Acknowledgements

- [Flutter](https://flutter.dev/)
- [Express.js](https://expressjs.com/)
- [MongoDB](https://www.mongodb.com/)
