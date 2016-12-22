# start container
bin/up espruino

# exec bash for espruino
docker exec -it espruino_espruino_1 bash
```
# compile esp-open-sdk
cd ~/esp-open-sdk
make

# define env vars for compiling espruino
export ESP8266_BOARD=1
export FLASH_4MB=1
export ESP8266_SDK_ROOT=/home/user/esp-open-sdk/ESP8266_NONOS_SDK_XXXXXXX
export ESPTOOL=/home/user/esp-open-sdk/esptool/esptool.py
export COMPORT=/dev/ttyUSB0
export PATH=$PATH:/home/esp-open-sdk/xtensa-lx106-elf/bin/

# compile espruino
cd ~/Espruino
make

# flash connected device
make flash
```
