print "Ready to start soft ap"
     
str = wifi.ap.getmac()

wifi.ap.config
	ssid:	"TTSwitch"
	pwd:	"12345678"
 
wifi.ap.setip
	ip:		"192.168.1.1"
	netmask:	"255.255.255.0"
	gateway:	"192.168.1.1"

wifi.setmode wifi.SOFTAP
    
str = nil
collectgarbage()
    
print "Soft AP started"
print "Heep:(bytes)#{node.heap()}"
print wifi.ap.getmac()
print wifi.ap.getip()
