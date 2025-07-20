local skynet = require "skynet"

local function test()
    skynet.fork(function()
        local s = 0
        for i = 1, 10000 do
            s = s + i
        end
    end)
end

local function test1()
    local profile = require "profile"
    local json = require "cjson"
    profile.start()
    tonumber("123")    
    print("111")
    local result = profile.stop()
    skynet.error("test1:", json.encode(result))
end

skynet.start(function()
    test1()

	skynet.fork(function()
        while true do
            test()
            skynet.sleep(100)
        end
    end)
end)

