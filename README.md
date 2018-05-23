Laptop Custom Backlight Brightness Regulator (Intel Video) For Linux
====================================================================

If you are unhappy with default backlight brightness regulation of your Intel graphics-based laptop (too bright at lowest level and burn your eyes at night), you can try this script.

Install intel-gpu-tools:
```
sudo apt-get install intel-gpu-tools
```

Make sure script intel_custom_backlight.sh is executable:
```
chmod +x intel_custom_backlight.sh
```

Put this file to `/usr/local/sbin`

In GNOME Keyboard Shortcuts create bindings "Backlight Up" and "Backlight Down", set commands respectively:
```
sudo intel_custom_backlight.sh up
sudo intel_custom_backlight.sh down
```
and bind any key combination you want (I choose Fn+Alt+Brightness Up and Fn+Alt+Brightness Down).

Tested on Acer Aspire V5-573G (i3-4010u, HD4400) + Ubuntu 18.04
