# Raw HTTP Request Logger

To run once call 

```
    npm install
```

then each time just the following command

```
    node server.mjs
```

Open another terminal and use the following curl command to send a HTTP request to this server 

```
    curl http://localhost:3000/
```

you should see the following output in the server terminal 

```
--- RAW REQUEST ---
GET / HTTP/1.1
host: localhost:3000
user-agent: curl/8.5.0
accept: */*


-------------------
```

Open [Test.html](Test.html) in your browser and try the different forms provided.
