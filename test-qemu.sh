#!/bin/bash
  
SSH_OPTIONS="-i /home/yx/Desktop/keystone/build/overlay/root/.ssh/id_rsa"
SSH_OPTIONS+=" -o StrictHostKeyChecking=no"
SSH_OPTIONS+=" -o UserKnownHostsFile=/dev/null"

upload_to_qemu() {
    echo "Uploading \"$(basename $1)\" to QEMU ..."
    scp ${SSH_OPTIONS} -P 5796 $1 root@localhost:.
}

run_in_qemu() {
    echo "Running \"$1\" in QEMU ..."
    ssh ${SSH_OPTIONS} -p 5796 root@localhost "$1"
}

#run_in_qemu "insmod keystone-driver.ko"

upload_to_qemu "staging/rv8-bench/riscv64/sm4.O3"
upload_to_qemu "staging/rv8-bench/riscv64/aes.O3"
upload_to_qemu "staging/bench-runner.riscv"

