const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
exports.sendNotification = functions.https.onRequest((req, res) => {
  const message = {
    notification: {
      title: "hello",
      body: "this is a test notification from android to iphone",
    },
    token: req.body.token, // iphone device token
  };
  admin
    .messaging()
    .send(message)
    .then((response) => {
      res.status(200).send("notification sent successfully");
    })
    .catch((error) => {
      res.status(500).send("error sending notification");
    });
});
