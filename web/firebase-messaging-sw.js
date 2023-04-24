importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

// todo Copy/paste firebaseConfig from Firebase Console
const firebaseConfig = {
  apiKey: "AIzaSyBY64pw3U9I6Hidx0Cao6VP8mNWEpYQIO4",
  authDomain: "parent-portal-app-36b77.firebaseapp.com",
  databaseURL: "https://parent-portal-app-36b77.firebaseio.com",
  projectId: "parent-portal-app-36b77",
  storageBucket: "parent-portal-app-36b77.appspot.com",
  messagingSenderId: "746458534934",
  appId: "1:746458534934:web:4bd32197625d629b159137",
  measurementId: "G-0RHL3T16MG"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// todo Set up background message handler