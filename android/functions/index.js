const functions = require("firebase-functions");

const stripe = require('stripe')("sk_test_51K9pBSSInPgXpYUdzHikdPudAgqdLUvvwPtQYl7ZQWVBgGEgFIvelSTNvldGEW15mDBsrzebGXSGp2SMIZWaLyvZ00l6m9lbqV")

 exports.stripepayment = functions.https.onRequest(async (request, response) => {

   const customers = await stripe.customers.list();

   // Here, we're getting latest customer only for example purposes.
   const customer = customers.data[0];

   if (!customer) {
     response.send({
       error: 'You have no customer created',
     });
   }

   const ephemeralKey = await stripe.ephemeralKeys.create(
     { customer: customer.id },
     { apiVersion: '2020-08-27' }
   );

   const paymentIntent = await stripe.paymentIntents.create({
     amount: 1099,
     currency: 'usd',
     customer: customer.id,
   });

   response.json({
     paymentIntent: paymentIntent.client_secret,
     ephemeralKey: ephemeralKey.secret,
     customer: customer.id,
   });






 });
