#!/bin/sh

set -e

cluster=$1
region=$2
project=$3
initialization_actions_script_bucket_name=$4
master_boot_disk_size=$5
master_boot_disk_type=$6
master_machine_type=$7
max_idle=$8
num_masters=$9
worker_boot_disk_size=$10
worker_boot_disk_type=$11
worker_machine_type=$12
zone=$13
image_version=$14
metadata=$15
scopes=$16
num_workers=$17
properties=$18

gcloud dataproc clusters create \
    $cluster \
    --region=$region \
    --project=$project \
    --enable-component-gateway \
    --initialization-actions=$initialization_actions_script_bucket_name \
    --master-boot-disk-size=$master_boot_disk_size \
    --master-boot-disk-type=$master_boot_disk_type \
    --master-machine-type=$master_machine_type \
    --max-idle=$max_idle \
    --num-masters=$num_masters \
    --worker-boot-disk-size=$worker_boot_disk_size \
    --worker-boot-disk-type=$worker_boot_disk_type \
    --worker-machine-type=$worker_machine_type \
    --zone=$zone \
    --image-version=$image_version \
    --metadata=$metadata \
    --scopes=$scopes \
    --num-workers=$num_workers \
    --properties=$properties
