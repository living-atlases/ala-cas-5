#  -*-shell-script-*-
#
# Password generation (based in bacula-common package)
#

genRandomPassword()
{
    cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c33
}

readOrCreatePasswords()
{
    PWE_FILE=/data/cas/config/pwe.properties
    if [ ! -f $PWE_FILE ]; then
        # Create the passwords.
        MD5SECRET=`genRandomPassword`

        # Save the passwords.
        echo "# " > $PWE_FILE
        chown cas:cas $PWE_FILE
        # TODO I think this is 644 (wrong) in ala-install
        chmod 0600 $PWE_FILE
        cat >>$PWE_FILE <<EOF
md5.secret=$MD5SECRET
md5.base64Encode=true
EOF
    fi
}
