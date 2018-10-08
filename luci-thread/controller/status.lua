module("luci.controller.thread.status", package.seeall)

function index()
    entry({"click", "here", "now"}, template("thread-status/hello"), "Click here", 10).dependent=false
end

function action_tryme()
    luci.http.prepare_content("text/plain")
    luci.http.write("Haha, rebooting now...")
end
