module("luci.controller.thread.network", package.seeall)

function index()
    entry({"admin", "network", "iface"}, cbi("thread_network/iface"), "Thread Interface", 10).dependent=false
end
