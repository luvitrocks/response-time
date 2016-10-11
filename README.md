# response-time

> Response time middleware for [Luvit.io](https://luvit.io) servers.

This module creates a middleware that records the response time for
requests in HTTP servers. The "response time" is defined here as the
elapsed time from when a request enters this middleware to when the
headers are written out to the client.

## Install

```bash
lit install voronianski/response-time
```

## API

### `responseTime(options)`

Create a middleware that adds a `X-Response-Time` header to responses.

### Options

The `responseTime` function accepts an optional `options` table that may
contain any of the following keys:

- `header` - the name of the header to set, defaults to `X-Response-Time`.

- `suffix` - the measurement suffix that is added to the output, defaults to `ms` (ex: `2.300ms` vs `2.300`).

## Examples

### Utopia

```lua
local Utopia = require('utopia')
local responseTime = require('response-time')

local app = Utopia:new()

app:use(responseTime())

app:get(function (req, res)
  res:finish('hello world!')
end)

app:listen(3000)
```

### Vanilla http server

```lua
local http = require('http')
local responseTime = require('response-time')

-- create "middleware"
local _responseTime = responseTime()

http.createServer(function (req, res)
  _responseTime(req, res, function ()
    res:finish('hello world!')
  end)
end):listen(3000)
```

## License

MIT Licensed

Copyright (c) 2016 Dmitri Voronianski [dmitri.voronianski@gmail.com](mailto:dmitri.voronianski@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
