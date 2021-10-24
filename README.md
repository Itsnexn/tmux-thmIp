# tmux-thmIp

#### By _**[Itsnexn](https://tryhackme.com/p/nexn)**_
#### _Simple shell script to show tryhackme IP address in tmux status bar_ 

## Description

This script will send a GET request to 10.10.10.10 and checks for
tryhackme keyword on the data.
if that was successful it will print the VPN interface IP address
otherwise it will print the default interface.

## Setup/Installation

- Manual

```bash
git clone https://github.com/itsnexn/tmux-thmIp.git /clone/path/tmux-thmIp
```

- TPM (Tmux Plugin Manager)

```bash
set -g @plugin "itsnexn/tmux-thmIp"
```

Update your config:

```
set -ga status-right "#{thmip}"
# OR
set -ga status-left "#{thmip}"
```

Reload tmux:

```
tmux source-file ~/.tmux.conf
```

## Default Settings

```bash
set -g @thm-vpn-interface "tun0"    # Your vpn interface (default tun0)
set -g @thm-sleep-time    "15"      # Sleep time after request was successful
set -g @thm-default-interface ""    # For example "eth0"
set -g @thm-padding " "             # Padding before and after the element
```

You can set `@thm-default-interface` to empty string to basically remove the element.

### License

> [MIT](./LICENSE) </br>
> Copyright (c) _Itsnexn 2021_
