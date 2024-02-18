# Support libraries for Makerchip

This module support a simple output peripheral composed by one diplay and 8-leds to be used with Makerchip.

To instantiate this module includes in the \SV section and \TLV section the following:

```
\SV
   m4_include_lib(['https://raw.githubusercontent.com/jimarinh/riscv_uq/main/tlv_files/myperipheral2.tlv'])                

\TLV
   m4+myperipheral()
```

This peripheral requires that two 8-bit signals must be declared to be attached to the module:

- `$outport0[7:0]`  : Display
- `$outport1[7:0]`  : LED
