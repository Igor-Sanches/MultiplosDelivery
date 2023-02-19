importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyCc6vVqyYAqAJuPCrEj6SIfFtolMYtD_8g",
    authDomain: "multiplosdelivery-5e66d.firebaseapp.com",
    projectId: "multiplosdelivery-5e66d",
    storageBucket: "multiplosdelivery-5e66d.appspot.com",
    messagingSenderId: "582037260677",
    appId: "1:582037260677:web:67cd19f9e5c18c093f5cec",
    measurementId: "G-N7M1RDEN02",
    databaseURL: "...",
});

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
            };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});
