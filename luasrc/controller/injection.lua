module("luci.controller.injection", package.seeall)
function index()
	entry({"admin", "network", "injection"},
		alias("admin", "network", "injection", "base"),
		_("Injection"), 60)
	
	entry({"admin", "network", "injection","base"},
		cbi("injection/base"),
		_("Injection Base"), 10).leaf = true
	
	entry({"admin", "network", "injection","redsocks"},
		cbi("injection/redsocks"),
		_("Injection Redsocks"), 20).leaf = true
end