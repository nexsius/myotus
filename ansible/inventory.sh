#!/usr/bin/env bash

if [ "$1" = "--list" ]; then
    APPIP=`terraform output app_external_ip`
    DBIP=`terraform output db_external_ip`
    cat << _EOF_
    {
        "_meta": {
            "hostvars": {
                "appserver": {
                    "ansible_host": "${APPIP}"
                },
                "dbserver": {
                    "ansible_host": "${DBIP}"
                }
            }
        },
        "app": {
            "hosts": [
                "appserver"
            ]
        },
        "db": {
            "hosts": [
                "dbserver"
            ]
        }
    }
_EOF_
else
    cat << _EOF_
    {
        "_meta": {
                "hostvars": {}
        },
        "all": {
                "children": [
                        "ungrouped"
                ]
        },
        "ungrouped": {}
    }
_EOF_
fi
