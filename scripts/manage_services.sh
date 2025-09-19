#!/usr/bin/env bash
set -e
APACHE="apache2"
TOMCAT="tomcat9"
POSTGRES="postgresql"

case "$1" in
  start)
    sudo service $APACHE start || true
    sudo service $POSTGRES start || true
    sudo service $TOMCAT start || true
    echo "✅ Services started."
    ;;
  stop)
    sudo service $TOMCAT stop || true
    sudo service $APACHE stop || true
    sudo service $POSTGRES stop || true
    echo "🛑 Services stopped."
    ;;
  restart)
    sudo service $APACHE restart || true
    sudo service $POSTGRES restart || true
    sudo service $TOMCAT restart || true
    echo "🔁 Services restarted."
    ;;
  status)
    echo "---- Apache ----";     sudo service $APACHE status | sed -n '1,10p' || true
    echo "---- PostgreSQL ----"; sudo service $POSTGRES status | sed -n '1,10p' || true
    echo "---- Tomcat ----";     sudo service $TOMCAT status | sed -n '1,10p' || true
    ;;
  *)
    echo "Bruk: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac
