# URL Shorterner

## Installation

```
git clone https://github.com/mbigras/urlshortener
cd urlshortener
bundle install
```

## Usage example

```
curl -d http://cats.com localhost:4567
curl -d http://dogs.com localhost:4567
curl -d http://github.com localhost:4567
curl localhost:4567/ | jq
# {
#   "99b0d7": "http://cats.com",
#   "83bb65": "http://dogs.com",
#   "bcdac1": "http://github.com"
# }
curl -s localhost:4567/ \
	| ruby -r json -ne 'puts JSON.parse($_).select{|k,v| v.match /git/}.keys.first' \
	| xargs -I {} open http://localhost:4567/{}
# opens localhost but gets redirected to GitHub
```
