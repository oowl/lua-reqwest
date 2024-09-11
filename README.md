# lua-reqwest

A simple Lua HTTP client based on [reqwest](https://docs.rs/reqwest/latest/reqwest/).

## Installation

```sh
# install from local source
luarocks make reqwest-0.1.0-1.rockspec
# install from luarocks
luarocks install lua-reqwest
```

## APIS

### reqwest.request(url, options)

- `url` (string): The URL to request.
- `options` (table): The request options.
  - `method` (string): The request method, default is `GET`.
  - `headers` (table): The request headers.
  - `body` (string): The request body.
  - `version` (number): The HTTP version, default is `1.1`.
  - `timeout` (number): The request timeout in seconds, default is `30`.
  - `connect_timeout` (number): The request connect timeout in seconds.
  - `tls_verify` (boolean): Verify the TLS certificate, default is `true`.

## Example

```lua
local reqwest = require("reqwest")
local cjson = require("cjson")

local res, err = reqwest.request("https://cloudflare.com/cdn-cgi/trace", { headers = { ["User-Agent"] = "reqwest" }, version = 2 })
print("err: " .. tostring(err))
print("res: " .. cjson.encode(res))
```

```sh
╰─$ luajit test.lua                                      
err: nil
res: {"status":200,"body":"fl=464f193\nh=cloudflare.com\nip=1.1.1.1\nts=1725552998.6\nvisit_scheme=https\nuag=reqwest\ncolo=SJC\nsliver=none\nhttp=http\/2\nloc=US\ntls=TLSv1.3\nsni=plaintext\nwarp=off\ngateway=off\nrbi=off\nkex=X25519\n","headers":{"date":"Thu, 05 Sep 2024 16:16:38 GMT","cf-ray":"8be786613aeacf2e-SJC","content-type":"text\/plain","x-content-type-options":"nosniff","server":"cloudflare","cache-control":"no-cache","x-frame-options":"DENY","access-control-allow-origin":"*","expires":"Thu, 01 Jan 1970 00:00:01 GMT"}}
```
