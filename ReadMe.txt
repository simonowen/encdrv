Quazar Trinity Ethernet Driver
------------------------------

Z80 driver code for the ENC28J60 chip on a Quazar Trinity Ethernet card.
See http://www.samcoupe.com/hardtrin.htm for further details.


Version 1.0 (2009/02/10)
- Initial release

----
Functions:

drv_init:
 Initialise device

 Entry: HL points to MAC address to use
 Exit:  BC=1 if successful, BC=0 if Trinity missing or ENC too old


drv_read:
 Read next packet

 Entry: HL points to receive buffer
 Exit:  BC holds length read, or zero if nothing available


drv_write:
 Transmit a packet, waiting until sent

 Entry: HL points to packet to sent, BC holds length
 Exit:  BC=1 for success, 0 if failed (tx_status has details)


drv_exit:
  Close ENC link, disabling reception

  Entry: none
  Exit:  none

---

Simon Owen
http://simonowen.com/
