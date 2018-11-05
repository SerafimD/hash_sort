# hash_sort
## Test Wallarm

POST
request :
```http://0.0.0.0:9292/behavior```

body :
```{"id":11,"properties":{"color":"green","location": "unknown", "type": "martian"}}```

response :
```{"id":1,"properties":"{\"color\":\"green\",\"location\":\"unknown\",\"type\":\"martian\"}","created_at":"2018-11-05T12:48:40.564Z","updated_at":"2018-11-05T12:48:40.564Z"}```

GET
Tree :
request :
```http://0.0.0.0:9292/hash/build_tree```

response :
```{
       "1": {
           "color": {
               "value": "green"
           },
           "location": {
               "value": "unknown"
           },
           "type": {
               "value": "martian"
           }
       }
   }
```
