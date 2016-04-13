function uber-ssh:alias() {
    if [ $# -eq 0 ]; then
        cat <<EOF
Usage: uber-ssh:alias [-s <ssh>] [-A <append>] [-P <prepend>] [-R <remove>]
                      <hostname>
EOF
        return 1
    fi

    local ssh_command
    local args
    local address

    :uber-ssh:parse-command-line "${@}"

    $ssh_command -XY -t $address "${args[@]}"
}

function :uber-ssh:parse-command-line() {
    local opts=()
    local remove
    local append
    local prepend

    zparseopts -a opts -D \
        's:=ssh_command' 'R:=remove' 'A:=append' 'P:=prepend'

    remove=${remove[2]}
    ssh_command=${ssh_command[2]:-ssh}
    append=${append[2]}
    prepend=${prepend[2]}

    local host=$1
    shift

    login=""
    if [ "${host%@*}" != "$host" ]; then
        login=${host%@*}@
        host=${host#*@}
    fi

    address=$login$prepend"${host%%$remove}"$append
    args=("$@")
}
