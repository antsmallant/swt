local skynet    = require "skynet"
local swt       = require "swt"

skynet.start(function()
    skynet.newservice("debug_console", 8000)
    skynet.newservice("swt_test")
    swt.start_master("0.0.0.0:9527")
    swt.start_agent("app", "node1", "0.0.0.0:9528")
end)

