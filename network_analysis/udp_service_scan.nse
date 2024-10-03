local shortport = require "shortport"
local nmap = require "nmap"
local stdnse = require "stdnse"
local table = require "table"
local string = require "string"

description = [[
    This script scans for UDP services running in the given network range
    and outputs their port numbers in ascending order as a comma-separated list.
]]

author = "Your Name"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery", "safe"}

portrule = shortport.port_or_service({53, 67, 68, 123, 161, 500}, "udp")

action = function(host, port)
    local udp_ports = {}
    
    -- Add discovered UDP ports to the table
    table.insert(udp_ports, port.number)
    
    -- Sort the ports
    table.sort(udp_ports)
    
    -- Output port numbers as comma-separated string
    local result = table.concat(udp_ports, ", ")
    
    return result
end

