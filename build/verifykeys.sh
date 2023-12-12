#!/bin/bash

KEYTOOL_PATH="$(command -v keytool)"

if [ -z "$KEYTOOL_PATH" ]; then
    for p in /usr/bin /usr/local/bin /usr/lib/jvm/*/bin; do
        if [ -x "$p/keytool" ]; then
            KEYTOOL_PATH="$p/keytool"
            break
        fi
    done
fi

OFFICIAL_FINGERPRINT="C8:5B:88:57:00:95:85:CE:32:01:4C:C1:B9:BC:16:87:3B:AA:2A:DE:89:36:64:E0:92:9B:BD:86:97:C6:63:D9"

BUILD_FINGERPRINT="vendor/lineage-priv/keys/releasekey.x509.pem"

CERT_FINGERPRINT=$("$KEYTOOL_PATH" -printcert -file "$BUILD_FINGERPRINT" \
    | grep -m1 "SHA256:" \
    | awk -F': ' '{print $2}')

if [ "$CERT_FINGERPRINT" = "$OFFICIAL_FINGERPRINT" ]; then
    echo "OFFICIAL"
else
    echo "UNOFFICIAL"
fi
