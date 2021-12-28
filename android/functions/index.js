const functions = require("firebase-functions");

const stripe = require('stripe')("sk_test_51K9pBSSInPgXpYUdzHikdPudAgqdLUvvwPtQYl7ZQWVBgGEgFIvelSTNvldGEW15mDBsrzebGXSGp2SMIZWaLyvZ00l6m9lbqV")

 exports.stripepayment = functions.https.onRequest(async (request, response) => {


// const paymentIntent = await stripe.paymentIntents.create({
//    amount: "100",
//    currency: "eur",
//    automatic_payment_methods: {
//      enabled: true,
//    },
//  });
//
//  response.send({
//    clientSecret: paymentIntent.client_secret,
//  });



   const customers = await stripe.customers.list({email: request.query.email,});

   // Here, we're getting latest customer only for example purposes.
   const customer = customers.data[0];

   if (!customer) {

    // Use an existing Customer ID if this is a returning customer.
     const customer = await stripe.customers.create(
     {
       name: request.query.name,
            email: request.query.email,
            phone:  request.query.phone,
     }
     );


     const ephemeralKey = await stripe.ephemeralKeys.create(
       {customer: customer.id},
       {apiVersion: '2020-08-27'}
     );

     const paymentIntent = await stripe.paymentIntents.create({
       amount: 1099,
       currency: 'usd',
       customer: customer.id,
       automatic_payment_methods: {
         enabled: true,
       },
       payment_method: request.query.pid,

     });

     response.json({

       paymentIntent: paymentIntent.client_secret,
       ephemeralKey: ephemeralKey.secret,
       customer: customer.id,
       publishableKey: 'pk_test_51K9pBSSInPgXpYUdgzGFJk1usakCKEpLVKyTnWAtoey5m6YNmAfg2sRPJhbA15WO6FqrgrfttLyeOjDYWTHuYcEO00fZ294a4T'

     });

   }else{

      const ephemeralKey = await stripe.ephemeralKeys.create(
        { customer: customer.id },
        { apiVersion: '2020-08-27' }
      );

      const paymentIntent = await stripe.paymentIntents.create({
        amount: 1099,
        currency: 'usd',
        customer: customer.id,
          automatic_payment_methods: {
                 enabled: true,
               },
                payment_method: 'card',
      });

      response.json({
        paymentIntent: paymentIntent.client_secret,
        ephemeralKey: ephemeralKey.secret,
        payment_method: request.query.pid,
      });


   }

 });
