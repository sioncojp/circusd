#!/bin/bash
#
# circusd This scripts turns circusd on
#
# Author: Shohei.Koyama
#
# chkconfig: - 95 04

# source function library
. /etc/rc.d/init.d/functions

CONFIG='/etc/circusd/circus.ini'
PIDFILE='/var/run/circusd.pid'
LOG_OUTPUT='/var/log/circusd/circusd.log'
RETVAL=0

start() {
    echo -n $"Starting circusd: "
    daemon /usr/local/bin/circusd --log-output $LOG_OUTPUT --pidfile $PIDFILE $CONFIG --daemon
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/circusd
}

stop() {
    echo -n $"Stopping circusd: "
    killproc circusd
    echo
    [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/circusd
}

restart() {
    stop
    start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart|force-reload|reload)
    restart
    ;;
  condrestart)
    [ -f /var/lock/subsys/circusd ] && restart
    ;;
  status)
    status circusd
    RETVAL=$?
    ;;
  *)
    echo $"Usage: $0 {start|stop|status|restart|reload|force-reload|condrestart}"
    exit 1
esac

exit $RETVAL
