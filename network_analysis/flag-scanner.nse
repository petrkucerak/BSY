local nmap = require "nmap"
local shortport = require "shortport"
local stdnse = require "stdnse"
local comm = require "comm"
local string = require "string"

description = [[
  This script scans the given IP range (172.20.1.100-200) and attempts to find
  a service that contains a flag in its banner.
]]

author = "ChatGPT"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery", "safe"}

portrule = function(host, port)
  -- Scan all open TCP ports
  return shortport.open(host, port)
end

action = function(host, port)
  -- Capture the banner from the service
  local result = comm.exchange(host, port, "", {recv_before = true})
  
  if result and string.find(result, "flag", 1, true) then
    return string.format("Flag found in banner on %s:%d: %s", host.ip, port, result)
  else
    return nil
  end
end
