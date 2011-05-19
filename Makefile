ifneq ($(KERNELRELEASE),)
	obj-m += tpe.o
else

KDIR=$(shell ./scripts/find_kernel_src.sh)

all:

	sh -xe ./scripts/insert_addr.sh tpe_template.c tpe.c

	make -C $(KDIR) M=$(PWD) modules

clean:

	make -C $(KDIR) M=$(PWD) clean

endif
