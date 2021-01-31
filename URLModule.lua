local module = {}
function module.char_to_hex(c)
  return string.format("%%%02X", string.byte(c))
end

function module.urlencode(url)
  if url == nil then
    return
  end
  url = url:gsub("\n", "\r\n")
  url = url:gsub("([^%w ])", module.char_to_hex)
  url = url:gsub(" ", "+")
  return url
end

function module.hex_to_char(x)
  return string.char(tonumber(x, 16))
end

function module.urldecode(url)
  if url == nil then
    return
  end
  url = url:gsub("+", " ")
  url = url:gsub("%%(%x%x)", module.hex_to_char)
  return url
end
return module
