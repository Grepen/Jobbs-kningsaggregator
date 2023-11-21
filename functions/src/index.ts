/**
 * Import function triggers from their respective submodules:
 *
 * 
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {onCall} from "firebase-functions/v2/https";
import {onRequest} from "firebase-functions/v2/https";

import * as logger from "firebase-functions/logger";

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = onRequest((req, res) => {
   logger.info("Hello logs! logging a request", {structuredData: true});

   res.send("Hello from Firebase!");
});


export const createDb = onCall(async (req) => {

    logger.info("Hello logging from create db!", {structuredData: true});


    //let response = await fetch("https://jobstream.api.jobtechdev.se/snapshot", {method: 'GET'});

    const url: string = 'https://jobsearch.api.jobtechdev.se';
    const urlForSearch: string = `${url}/search`;

    const headers: HeadersInit = {
        'accept': 'application/json'
    };
    
      
    const queryString: string = new URLSearchParams({'limit': '100'}).toString();
    const fullUrl: string = `${urlForSearch}?${queryString}`;

    logger.info("Hello logging from create db, we have created headers!", {structuredData: true});

    
    
    const response = await fetch(fullUrl, { method: 'GET', headers });
    //const response = await fetch("https://www.elprisetjustnu.se/api/v1/prices/2023/11-19_SE3.json");
    
    if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
    }
    

    logger.info("Hello logging from create db!, we ahve recieved fetch", {structuredData: true});
    let responseText = await response.text();
    logger.info("Hello logging from create db!, we have turend resp into text", {structuredData: true});
    let data = JSON.parse(responseText);

    logger.info(data, {structuredData: true});

    logger.info("hejsan", {structuredData: true});

    logger.info(responseText, {structuredData: true});

    return {};

});


 
