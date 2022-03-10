# Manual things to do after an os installation (also FAQs)

1. Fix the extreme lag on external monitor when using a usb dock (e.g ugreen).
Works with nvidia card.
but it increases the CPU usage a lot.

```
# edit /etc/environment
# add this line
LIBGL_DRI3_DISABLE=true
```
OR

Display latest DisplayLink driver from
https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu-5.5?filetype=exe
