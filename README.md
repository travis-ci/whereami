# whereami

Provide some metadata based on the remote addr :tada: :smile_cat:

## deployments

There is a deployment of this application [managed in the
travis-ci/terraform-config repository] available at
https://whereami.travis-ci.com.

## usage

Fetch a json representation of the requesting IP and detected infrastructure:

``` bash
curl https://whereami-production-0.herokuapp.com
```

Same as above, but requesting an explicit content type:

``` bash
curl -H "Accept: application/json" https://whereami-production-0.herokuapp.com
```

Request a plain text representation:

``` bash
curl -H "Accept: text/plain" https://whereami-production-0.herokuapp.com
```

[managed in the travis-ci/terraform-config repository]: (https://github.com/travis-ci/terraform-config/blob/fb05f78b1e80b27c0dd531282b4c3266a44febcb/dns-production-0/main.tf#L152-L208)
