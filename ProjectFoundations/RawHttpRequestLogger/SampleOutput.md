# Sample Output


## Anchor link (GET REQUEST)

```html
<a href="http://localhost:3000/demo/index.html" target="_blank"> here </a>
```

```
GET /demo/index.html HTTP/1.1
host: localhost:3000
connection: keep-alive
upgrade-insecure-requests: 1
user-agent: Mozilla/5.0 
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
sec-fetch-site: cross-site
sec-fetch-mode: navigate
sec-fetch-user: ?1
sec-fetch-dest: document
accept-encoding: gzip, deflate, br, zstd
accept-language: en-GB,en-US;q=0.9,en;q=0.8,te;q=0.7


```

## Anchor link (GET REQUEST WITH DATA)

```html
<a href="http://localhost:3000/demo/api/product?id=1" target="_blank"> here
```

```
GET /demo/api/product?id=1 HTTP/1.1
host: localhost:3000
connection: keep-alive
upgrade-insecure-requests: 1
user-agent: Mozilla/5.0 
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
sec-fetch-site: cross-site
sec-fetch-mode: navigate
sec-fetch-user: ?1
sec-fetch-dest: document
accept-encoding: gzip, deflate, br, zstd
accept-language: en-GB,en-US;q=0.9,en;q=0.8,te;q=0.7


```

## HTML Form (GET REQUEST)

```html
    <form class="centered-form" action="http://localhost:3000/api/target">
            <input type="text" id="name" name="name"><br><br>
            <input type="text" id="address" name="address"><br><br>
            <input type="submit" value="Submit">
    </form>
```

```
GET /api/target?name=abc&address=xyz HTTP/1.1
host: localhost:3000
connection: keep-alive
upgrade-insecure-requests: 1
user-agent: Mozilla/5.0 
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
sec-fetch-site: cross-site
sec-fetch-mode: navigate
sec-fetch-user: ?1
sec-fetch-dest: document
accept-encoding: gzip, deflate, br, zstd
accept-language: en-GB,en-US;q=0.9,en;q=0.8,te;q=0.7


```
## HTML Form (POST REQUEST)

```html

<form class="centered-form" action="http://localhost:3000/api/target" method="post">
    <input type="text" id="name" name="name"><br><br>
    <input type="text" id="address" name="address"><br><br>
    <input type="submit" value="Submit">
</form>

```

```
POST /api/target HTTP/1.1
host: localhost:3000
connection: keep-alive
content-length: 20
cache-control: max-age=0
content-type: application/x-www-form-urlencoded
upgrade-insecure-requests: 1
user-agent: Mozilla/5.0 
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
sec-fetch-site: cross-site
sec-fetch-mode: navigate
sec-fetch-user: ?1
sec-fetch-dest: document
accept-encoding: gzip, deflate, br, zstd
accept-language: en-GB,en-US;q=0.9,en;q=0.8,te;q=0.7

name=abc&address=xyz
```

## HTML Form (POST WITH MULTIPART DATA)

```html
    <form class="centered-form" action="http://localhost:3000/api/target" method="post" enctype="multipart/form-data">
            <input type="text" id="name" name="name"><br><br>
            <input type="text" id="address" name="address"><br><br>
            <input type="file" id="file" name="file"><br><br>
            <input type="submit" value="Submit">
    </form>
```

```
POST /api/target HTTP/1.1
host: localhost:3000
connection: keep-alive
content-length: 373
cache-control: max-age=0
origin: null
content-type: multipart/form-data; boundary=----WebKitFormBoundaryjwkfCZBw1nveM952
upgrade-insecure-requests: 1
user-agent: Mozilla/5.0 
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
accept-encoding: gzip, deflate, br, zstd
accept-language: en-GB,en-US;q=0.9,en;q=0.8,te;q=0.7

------WebKitFormBoundaryjwkfCZBw1nveM952
Content-Disposition: form-data; name="name"

abc
------WebKitFormBoundaryjwkfCZBw1nveM952
Content-Disposition: form-data; name="address"

xyz
------WebKitFormBoundaryjwkfCZBw1nveM952
Content-Disposition: form-data; name="file"; filename="test.txt"
Content-Type: text/plain


------WebKitFormBoundaryjwkfCZBw1nveM952--

```