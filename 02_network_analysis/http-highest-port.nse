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
