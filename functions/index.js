/**
 * Import function triggers from their respective submodules:
 *
 * 
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onCall } = require("firebase-functions/v2/https");
//const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.getApi = onCall(async (req, res) => {
    /*
    logger.info("Hello from method get");
    
    
    let response = await fetch("https://jobstream.api.jobtechdev.se/snapshot?location-concept-id=p8Mv_377_bxp", {method: 'GET'});
    
    logger.info("got api");
    let resText = await response.text();
    logger.info("got text");

    res.send("Hello from Firebase!");

Ä*/
    let data;
    logger.info("fetching data");
    fetch("https://jobstream.api.jobtechdev.se/stream?date=2023-11-09T08:03:22&location-concept-id=p8Mv_377_bxp", {
      method: 'GET',
      headers: {
        accept: 'application/json',
      },
    })
        .then(response => {
            logger.info("got data");


            response.text()
                .then(resText => {
                    logger.info("resText");
                    data = JSON.parse(resText);

                    logger.info(data);








                })
        })
});




