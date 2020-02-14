#!/bin/sh

# with openrc use loginctl
[[ $(cat /proc/1/comm) == "systemd" ]] && logind=systemctl || logind=loginctl

case "$1" in
    lock)
        exec i3lock -c 000000 "${@:2}"
        ;;
    logout)
        exec i3-msg exit
        ;;
    switch_user)
        exec dm-tool switch-to-greeter
        ;;
    suspend)
        exec $logind suspend
        ;;
    hibernate)
        exec $logind hibernate
        ;;
    reboot)
        exec $logind reboot
        ;;
    shutdown)
        exec $logind poweroff
        ;;
    *)
        echo "== ! i3exit: missing or invalid argument ! =="
        echo "Try again with: lock | logout | switch_user | suspend | hibernate | reboot | shutdown"
        exit 2
esac

exit 0
