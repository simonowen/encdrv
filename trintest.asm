; Quazar Trinity ethernet driver test

               ORG  &8000

               JP   bas_init       ; BASIC entry points
               JP   bas_read
               JP   bas_write
               JP   bas_exit

               ORG  &8010
               DUMP $

packet_start:  DEFW packet_buf
packet_len:    DEFW tx_length

               INC  "encdrv.asm"

mac_address:   DEFB &02,&A4,&92,&E4,&D3,&20

bas_init:      LD   HL,mac_address
               JP   drv_init
bas_read:      LD   HL,(packet_start)
               JP   drv_read
bas_write:     LD   HL,(packet_start)
               LD   BC,(packet_len)
               JP   drv_write
bas_exit:      JP   drv_exit

packet_buf:
; ICMP ECHO request to 10.0.0.255 from 10.0.0.88
tx_packet:     DEFB &00,&18,&F3,&FE,&8D,&FA
               DEFB &02,&A4,&92,&E4,&D3,&20
               DEFB &08,&00
               DEFB &45,&00,&00,&3C,&E7,&B7,&00,&00,&80
               DEFB &01,&3E,&B0
               DEFB &0A,&00,&00,&58
               DEFB &0A,&00,&00,&02
               DEFB &08,&00,&3E,&58,&02,&00
               DEFB &0D,&04
               DEFB &61,&62,&63,&64,&65,&66,&67,&68
               DEFB &69,&6A,&6B,&6C,&6D,&6E,&6F,&70
               DEFB &71,&72,&73,&74,&75,&76,&77,&61
               DEFB &62,&63,&64,&65,&66,&67,&68,&69
tx_length:     EQU  $-tx_packet
               DEFS max_pkt_len
end:
