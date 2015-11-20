# Identity Code as a Service

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/defeed/identitycode-api)

## Validation

```
$ curl 'http://localhost:3000/isikukood/validate?code=38312203720'
> {
    "identityCode": "38312203720",
    "isValid": true,
    "sex": "M",
    "birthDate": "1983-12-20",
    "age": 31
  }
```

## Generation

### Array of valid identity codes

```
$ curl 'http://localhost:3000/isikukood/generate'
> [
    {
      "identityCode": "46610227076"
    },
    {
      "identityCode": "38712194905"
    },
    {
      "identityCode": "37212114942"
    },
    {
      "identityCode": "37502204293"
    },
    {
      "identityCode": "38809057014"
    },
    {
      "identityCode": "47307276072"
    },
    {
      "identityCode": "38808124937"
    },
    {
      "identityCode": "47604095702"
    },
    {
      "identityCode": "48502210151"
    },
    {
      "identityCode": "39311294298"
    }
  ]
```

Accepts params:
* `count` (optional): number of codes to generate, default is 10, minimum is 1, maximum is 1000
* `sex` (optional): either `M` or `F`, default is random
* `safe_age` (optional): either `true` or `false`, default is `true`, meaning that generated codes will belong to people 19..50 years old. If `true`, then `year` param will be ignored
* `year` (optional): year of birth, default is random
* `month` (optional): month of birth, default is random
* `day` (optional): day of birth, default is random

### Single valid identity code

```
$ curl 'http://localhost:3000/isikukood/random'
> {
    "identityCode": "46610227076"
  }
```

Accepts only `safe_age` optional param, default is `true` (see above)
