# hash_sort

[![Build Status](https://travis-ci.org/SerafimD/hash_sort.svg?branch=master)](https://travis-ci.org/SerafimD/hash_sort)
[![Maintainability](https://api.codeclimate.com/v1/badges/7f367cb2598f92583212/maintainability)](https://codeclimate.com/github/SerafimD/hash_sort/maintainability)

* [Heroku] - The application is deployed in the cloud
* [Reportage] - Home project gem for generating reports

Manage Actions
* **Method:**
<_`GET`_> /behavior

* **Method:**
<_`GET`_> /behavior/:id
* **Method:**
<_`POST`_> /behavior
```
   {
     "id": 12,
     "properties": {
       "location": "Moscow"
     }
   }
```
* **Method:**
<_`DELETE`_> /behavior/:id

Work with DecisionTree
* **Method:**
<_`GET`_> /hash/build_tree_v1
`Work as in the example`
* **Method:**
<_`GET`_> /hash/build_tree_v2
`I think it should work like this`
* **Method:**
<_`GET`_> /hash/build_tree_v1_pdf
`Generate tree in .pdf version 1`
* **Method:**
<_`GET`_> /hash/build_tree_v2_pdf
`Generate tree in .pdf version 2`

[Heroku]: <https://mighty-earth-34915.herokuapp.com/>
[Reportage]: <https://github.com/SerafimD/reportage>