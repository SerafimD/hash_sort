# hash_sort
## Test Wallarm
[![Build Status](https://travis-ci.org/SerafimD/hash_sort.svg?branch=master)](https://travis-ci.org/SerafimD/hash_sort)

Income POST data
`` 
[
    {
        "x1": "aaa",
        "x2": "bbb",
        "x3": "ccc"
    },
    {
        "y1": "bbb",
        "y2": "ccc",
        "y3": "ddd"
    },
    {
        "z1": "ccc",
        "z2": "ddd",
        "z3": "eee"
    }
]
 ``
 
 response 
 ``
 {
 "aaa":[
 "x1"
 ],
 "bbb":[
 "x2",
 "y1"
 ],
 "ccc":[
 "x3",
 "y2",
 "z1"
 ],
 "ddd":[
 "y3",
 "z2"
 ],
 "eee":[
 "z3"
 ]
 }
 ``
 
 