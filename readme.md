Moxa serial (mxser) Linux driver and tools modified for latest kernels 
(supported kernel 5.11 and above).
Intended for CP-1XX and other MOXA multiport serial RS232/485 boards
Based on original  Moxa Linux kernel 5.x.x drivers (09/02/2019)

You should disable old SmartIO (mxser) drivers in kernel tree
```
  │ Symbol: MOXA_SMARTIO 
  │   Prompt: Moxa SmartIO support v. 2.0 
  │   Location:  
  │     -> Device Drivers
  │       -> Character devices  
  │           -> Non-standard serial port support
```  

### Driver install (mxupcie, mxser)
```
make mxser 
make driver_install
```

### Configuration tool install (muestty)
```
cd utility/conf
make 
make install
```

### For load PCIe card support
```
modprobe mxupcie
```

### Configure port
Set 2 wire RS485 mode on port 0
```
muestty -i RS4852W /dev/ttyMUE0
```
Enable termination resistor on port 3
```
muestty -t 120TERM /dev/ttyMUE3
```

See original [readme.txt](./readme.txt) for more information

