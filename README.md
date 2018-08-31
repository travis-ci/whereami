# whereami

Provide some metadata based on the remote addr :tada: :smile_cat:

## deployments

There is a deployment of this application [managed in the
travis-ci/terraform-config repository](https://git.io/fAc9K) available at
https://whereami.travis-ci.com.

## usage

Fetch a json representation of the requesting IP and detected infrastructure:

``` bash
curl https://whereami.travis-ci.com
```

Same as above, but requesting an explicit content type:

``` bash
curl -H "Accept: application/json" https://whereami.travis-ci.com
```

Request a plain text representation:

``` bash
curl -H "Accept: text/plain" https://whereami.travis-ci.com
```
