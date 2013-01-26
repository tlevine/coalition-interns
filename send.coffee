#!/usr/bin/env coffee
nodemailer = require "nodemailer"

SERVICE =
  email: "Thomas Levine <occurrence@thomaslevine.com>"

# create reusable transport method (opens pool of SMTP connections)
smtpTransport = nodemailer.createTransport "SMTP",
  host: "mail.gandi.net"
  secureConnection: true
  port: 465 # port for secure SMTP
  auth:
    user: "person@thomaslevine.com"
    pass: "XfIqupPLXXkm9c7DLGgxj2IhEp5uCqs6"

# setup e-mail data with unicode symbols
mailOptions =
  from: "State Coalition <person@thomaslevine.com>"
  to: SERVICE.email
  subject: "Hello ✔"
  text: "Hello world ✔" # plaintext body
# html: "<b>Hello world ✔</b>" # html body

# send mail with defined transport object
smtpTransport.sendMail mailOptions, (error, response) ->
  if(error)
    console.log(error)
  else
    console.log("Message sent: " + response.message)

smtpTransport.close() # shut down the connection pool, no more messages
