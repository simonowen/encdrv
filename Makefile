DISK=trintest.dsk

.PHONY: clean

$(DISK): trintest.asm encdrv.asm
	pyz80.py -I samdos2 --exportfile=trintest.sym trintest.asm

clean:
	rm -f $(DISK) trintest.sym
