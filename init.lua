local os = require('os')

require('on-headers-event')

-- round number to decimals, defaults to 2 decimals
function roundToDecimals (num, decimals)
  decimals = decimals or 2

  local shift = 10 ^ decimals
  local result = math.floor(num * shift + 0.5) / shift

  return result
end

function responseTime (opts)
  opts = opts or {}
  opts.header = opts.header or 'X-Response-Time'
  opts.suffix = opts.suffix or 'ms'

  return function (req, res, nxt)
    if res._responseTime then
      return nxt()
    end

    local startTime = os.clock()

    res._responseTime = true
    res:on('headers', function ()
      local duration = roundToDecimals((os.clock() - startTime) * 1000)

      res:setHeader(opts.header, duration .. opts.suffix)
    end)

    nxt()
  end
end

return responseTime
