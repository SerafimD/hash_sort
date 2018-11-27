# hash_sort
## Test Wallarm

[![Build Status](https://travis-ci.org/SerafimD/hash_sort.svg?branch=master)](https://travis-ci.org/SerafimD/hash_sort)

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
```http://0.0.0.0:9292/hash/build_tree_v1```

response :
```{
       "json": {
           "result": {
               "key": "color",
               "values": {
                   "green": {
                       "key": "location",
                       "values": {
                           "unknown": [
                               11
                           ]
                       }
                   },
                   "red": {
                       "key": "real",
                       "values": {
                           "no": [
                               12
                           ]
                       }
                   }
               },
               "default": {
                   "key": "location",
                   "values": {
                       "Moscow": [
                           13
                       ]
                   }
               }
           }
       }
   }

```

Heroku
https://mighty-earth-34915.herokuapp.com/

