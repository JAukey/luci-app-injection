require("luci.sys")
m = Map("injection", translate("Webpage Injection Base"), translate("Emerge Webpage Injection Project."))
s = m:section(TypedSection,"base",translate("Base Setting"))
s.template = "cbi/injsection"
s.addremove = false
s.anonymous = true
s:option(Flag, "enabled", translate("Enable"))
s:option(Flag, "http_enabled", translate("Http Enable"),translate("Enable Normal Http Injection")) 
s:option(Flag, "https_enabled", translate("Https Enable"),translate("Enable Normal Https Injection"))
s:option(Flag, "http_global", translate("Http Global Enable"),translate("Enable Global Http Injection"))
s:option(Flag, "https_global", translate("Https Global Enable"),translate("Enable Global Https Injection"))
s:option(Value, "local_http_port", translate("Local Http Port"))
s:option(Value, "local_https_port", translate("Local Https Port"))
s:option(Value, "interfaces", translate("Interfaces"),translate("Interface should be separate by ' , ',like 'br-lan,eth0'."))

s = m:section(TypedSection,"cache",translate("Cache Setting"))
s.template = "cbi/injsection"
s.addremove = false
s.anonymous = true
s:option(Flag, "cache_enabled", translate("Cache Enable"))
s:option(Value, "cache_local_port", translate("Cache Local Port"))
s:option(Value, "cache_local_path", translate("Cache Local Path"))
s:option(Value, "cache_server", translate("Cache Server"))
s:option(Value, "cache_server_port", translate("Cache Server Port"))
s:option(Value, "ngxconf", translate("Nginx Configuration File"))

s = m:section(TypedSection,"http_domain",translate("Http Domain Setting"))
s.template = "cbi/tdomain"
s.addremove = true
s.anonymous = true
s:option(Value, "domain", translate("Http Domain"))
s:option(Value, "ip", translate("IP"))

s = m:section(TypedSection,"https_domain",translate("Https Domain Setting"))
s.template = "cbi/tdomain"
s.addremove = true
s.anonymous = true
s:option(Value, "domain", translate("Https Domain"))
s:option(Value, "ip", translate("IP"))

s = m:section(TypedSection,"http_domain_bypass",translate("Http Domain Bypass Setting"))
s.template = "cbi/tdomain"                                                              
s.addremove = true                                                                      
s.anonymous = true                                                                      
s:option(Value, "domain", translate("Http Domain Bypass"))                              
s:option(Value, "ip", translate("IP")) 

s = m:section(TypedSection,"https_domain_bypass",translate("Https Domain Bypass Setting"))
s.template = "cbi/tdomain"
s.addremove = true
s.anonymous = true
s:option(Value, "domain", translate("Https Domain Bypass"))
s:option(Value, "ip", translate("IP"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
     io.popen("/etc/init.d/injection restart")
end
return m
