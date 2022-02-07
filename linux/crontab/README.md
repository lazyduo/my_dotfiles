# crontab setting
as root user : `sudo crontab -e`

## reboot

```bash
SHELL=/bin/bash # to run script by bash (default is sh)
@reboot /home/smartmind/jupyter-start.sh
```