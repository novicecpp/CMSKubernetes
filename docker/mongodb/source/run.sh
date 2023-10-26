#!/bin/bash
### This script relies on provided keytab file which will be
### be mounted to /etc/secrets area
if [ -f /etc/secrets/keytab ]; then
  export keytab=/etc/secrets/keytab
  principal=`klist -k "$keytab" | tail -1 | awk '{print $2}'`
  kinit $principal -k -t "$keytab" 2>&1 1>& /dev/null
  if [ $? == 1 ]; then
    echo "Unable to perform kinit operation for cmsweb keytab."
    exit 1
  fi
fi
