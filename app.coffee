#!/usr/bin/env coffee

nodemailer = require "nodemailer"

# create reusable transport method (opens pool of SMTP connections)
smtpTransport = nodemailer.createTransport "SMTP",
  service: "Gmail"
    auth:
      user: "gmail.user@gmail.com"
      pass: "userpass"

# setup e-mail data with unicode symbols
mailOptions =
  from: "Fred Foo ✔ <foo@blurdybloop.com>",
  to: "bar@blurdybloop.com, baz@blurdybloop.com",
  subject: "Hello ✔",
  text: "Hello world ✔", # plaintext body
# html: "<b>Hello world ✔</b>" # html body

# send mail with defined transport object
smtpTransport.sendMail mailOptions, (error, response) ->
  if(error)
    console.log(error)
  else
    console.log("Message sent: " + response.message)
                                        }
smtpTransport.close() # shut down the connection pool, no more messages
