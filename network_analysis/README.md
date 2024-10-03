# Notes

## Great, kid, don't get cocky.

There are two UDP services running in the given network range (172.20.1.100-200). Please input their port numbers as a sorted, comma separated list in ascending order. For example if the ports are 27346 and 9834 you should write

9834,27346

Hint: the ports are well known

```lua
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
```

```sh
sudo nmap -sU --script=udp_service_scan.nse -p 1-65535 172.20.1.100-200
```

## Try not. Do or do not. There is no try.

What is the highest port used by the HTTP servers in the given range? (172.20.1.100-200) Please use a numerical value.

```lua
local shortport = require "shortport"
local stdnse = require "stdnse"
local nmap = require "nmap"
local string = require "string"
local table = require "table"

description = [[
  Finds the highest port used by HTTP servers in the specified IP range.
]]

author = "Your Name"
license = "Same as Nmap"
categories = {"discovery", "safe"}

-- Define the script arguments
portrule = shortport.http

-- Main function
action = function(host, port)

    -- Define an empty table to store open HTTP ports
    local open_ports = {}

    -- Loop over the provided range (172.20.1.100-200)
    for ip = 100, 200 do
        local target_ip = "172.20.1." .. tostring(ip)
        
        -- Perform a port scan looking for HTTP services
        local scan_results = nmap.new_scan()
        scan_results:add_host(target_ip)
        scan_results:add_ports("80,443,8080,8443,8000-8999")  -- Common HTTP ports

        -- Execute the scan
        local status, results = scan_results:run()

        if status then
            -- Check for open HTTP ports
            for _, port in ipairs(results) do
                if portrule(host, port) then
                    table.insert(open_ports, port.number)
                end
            end
        end
    end

    -- Find the highest port from the open HTTP ports
    if #open_ports > 0 then
        local highest_port = math.max(unpack(open_ports))
        return "Highest HTTP port found: " .. tostring(highest_port)
    else
        return "No HTTP servers found in the specified range."
    end
end
```

```sh
nmap --script http-highest-port -p 80,443,8080,8443,8000-8999 172.20.1.100-200
```

## There’s always a bigger fish.

Solution: use ncat with service 172.20.1.149:19333 and solve math task.
