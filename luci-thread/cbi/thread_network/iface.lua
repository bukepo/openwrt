m = Map("thread", "Network") -- We want to edit the uci config file /etc/config/network
m.apply_on_parse = true

s = m:section(TypedSection, "thread-iface", "Thread Interface") -- Especially the "interface"-sections
s.addremove = false -- Allow the user to create and remove the interfaces
s.anonymous = true -- Allow the user to create and remove the interfaces

s:option(Value, "ifname", translate("Network Interface"), "the physical interface to be used") -- This will give a simple textbox
s:option(Value, "networkname", translate("Network Name")) -- Ja, das ist eine i18n-Funktion ;-)
s:option(Value, "panid", translate("PAN ID")) -- Ja, das ist eine i18n-Funktion ;-)
s:option(Value, "xpanid", translate("Extended PAN ID")) -- Ja, das ist eine i18n-Funktion ;-)
s:option(Value, "password", translate("Admin Password")) -- Ja, das ist eine i18n-Funktion ;-)
s:option(Value, "masterkey", translate("Master Key")) -- Ja, das ist eine i18n-Funktion ;-)
c = s:option(ListValue, "channel", translate("Channel")) -- Ja, das ist eine i18n-Funktion ;-)
c:value("11", "11") -- Key and value pairs
c:value("12", "12")
c.default = "11"

s:option(Value, "netmask", "Netmask"):depends("proto", "static") -- You may remember this "depends" function from above

mlp = s:option(Value, "meshlocalprefix", translate("Mesh Local Prefix"))
mlp.optional = true -- This one is very optional
function mlp:validate(value) -- Now, that's nifty, eh?
    return value:match("[0-9a-f:]+") -- Returns nil if it doesn't match otherwise returns match
end

return m -- Returns the map
