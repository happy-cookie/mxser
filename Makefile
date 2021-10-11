KERNEL_VERSION_MAJOR_NUMBER:=$(shell uname -r | cut -f1 -d.)
KERNEL_VERSION_MINOR_NUMBER:=$(shell uname -r | cut -f2 -d.)

DRIVER_PATH:=driver/kernel5.x

all: check_version utility_make mxser

SP1: check_version utility_make mxsersp1

SP2: check_version utility_make mxsersp2

install: check_version clean utility_install driver_install
installsp1: check_version utility_install driver_installsp1
installsp2: check_version utility_install driver_installsp2

clean: check_version driver_clean  utility_clean

remove: check_version uninstall
uninstall: check_version driver_uninstall utility_uninstall

check_version:
ifneq ("$(KERNEL_VERSION_MAJOR_NUMBER)","5")
	@echo "Error: Your kernel version is $(KERNEL_VERSION_MAJOR_NUMBER).x."
	@echo "       This driver only support linux kernel 5.x."
	@exit 1;
endif

utility_make :
	@cd utility;\
	make -s

mxser :
	@cd ${DRIVER_PATH};\
	make -s 

mxsersp1 :
	@cd ${DRIVER_PATH};\
	make SP1 -s

mxsersp2 :
	@cd ${DRIVER_PATH};\
	make SP2 -s

driver_install:
	@echo ""
	@echo " Build driver for Linux kernel ${KERNEL_VERSION_MAJOR_NUMBER}.x"
	@echo ""
	@cd ${DRIVER_PATH};\
	make install -s 

driver_installsp1:
	@cd ${DRIVER_PATH};\
	make installsp1 -s
	
driver_installsp2:
	@cd ${DRIVER_PATH};\
	make installsp2 -s
	
utility_install:
	@cd utility;\
	make install -s 


driver_clean:
	@cd ${DRIVER_PATH};\
	make clean -s

utility_clean:
	@cd utility;\
	make clean -s

driver_uninstall:
	@cd ${DRIVER_PATH};\
	make uninstall -s

utility_uninstall:
	@cd utility;\
	make uninstall -s



