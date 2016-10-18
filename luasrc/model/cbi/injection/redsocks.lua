require("luci.sys")

m = Map("redsocks", translate("Webpage Injection Redsocks"), translate("Emerge Webpage Injection Project."))
s = m:section(TypedSection,"base",translate("Redsocks Setting"))
s.template = "cbi/redsection"
s.addremove = false
s.anonymous = true
s:option(Flag, "enabled", translate("Enable"))
s:option(Value, "log_debug", translate("Log Debug"))
s:option(Value, "log_info", translate("Log Info"))
s:option(Value, "log", translate("Log"))
s:option(Value, "daemon", translate("Daemon"))
s:option(Value, "user", translate("User"))
s:option(Value, "chroot", translate("Chroot"))
s:option(Value, "redirector", translate("Redirector"))

q = m:section(TypedSection, "server", translate("Servers Setting"))
q.template = "cbi/tredsocks"
q.anonymous = true
q.addremove = true
q:option(Value, "local_ip", translate("Local IP"))
q:option(Value, "local_port", translate("Local Port"))
q:option(Value, "server_ip", translate("Server IP"))
q:option(Value, "server_port", translate("Server Port"))
local po=q:option(ListValue, "http_type", translate("Http Type"))
po:value("http-relay",  translate("Http"))
po:value("http-connect",  translate("Https"))
q:option(Value, "network_id", translate("Network ID"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
     io.popen("/etc/init.d/redsocks restart")
end
return m