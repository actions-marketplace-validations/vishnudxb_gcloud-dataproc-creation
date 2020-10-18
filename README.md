
# Github Action for creating Google Cloud Dataproc cluster

A Github Action to create a dataproc cluster for your test use-cases.

## Usage

```yaml
# Setup gcloud CLI
- uses: GoogleCloudPlatform/github-actions/setup-gcloud@master
  with:
    version: '314.0.0'
    service_account_key: ${{ secrets.service_account_key }}
    service_account_email: ${{ secrets.service_account_email }}
    project_id: ${{ secrets.project_id }}
    export_default_credentials: true
- run: gcloud info

- name: Create Google Cloud Dataproc cluster
  uses: vishnudxb/gcloud-dataproc-creation@main
  with:
    cluster: "your dataproc cluster name"
    region: "Your dataproc luster region"
    project: "Your gcloud project id"
    initialization-actions: "gs://<your bucket>/<initialization-script.sh>"
    master-boot-disk-size: "500GB"
    master-boot-disk-type: "pd-standard"
    master-machine-type: "n1-standard-2"
    max-idle: "1h"
    num-masters: 1
    worker-boot-disk-size: "500GB"
    worker-boot-disk-type: "pd-standard"
    worker-machine-type: "n1-standard-2"
    zone: "us-east1-b"
    image-version: "preview-ubuntu18"
    metadata: "PIP_PACKAGES=$(sed -e '/^#/d' -e 's/#.*$//' -e 's/ *$//g' requirements.txt | tr '\n' ' ')"
    scopes: "https://www.googleapis.com/auth/cloud-platform"
    num-workers: 2
    properties: "spark:spark.scheduler.mode=FIFO"
    labels: "service=web-app,env=dev"

```

### The inputs description:

```yaml
inputs:
  cluster:
    description: 'Enter your gcloud dataproc cluster name'
    required: true
  region:
    description: 'Enter your gcloud dataproc cluster region'
    required: false
    default: us-east1
  project:
    description: 'Enter your gcloud project id'
    required: true
  initialization_actions:
    description: 'Executables or scripts that will run on all nodes in your cluster immediately after the cluster is set up'
    required: true
  master-boot-disk-size:
    description: 'Dataproc Master Boot disk size'
    required: false
    default: 500GB
  master-boot-disk-type:
    description: 'Dataproc Master Boot disk type'
    required: false
    default: pd-standard
  master-machine-type:
    description: 'Dataproc Master Machine type'
    required: false
    default: n1-standard-2
  max-idle:
    description: 'The duration before cluster is auto-deleted after last job completes, such as "2h" or "1d".'
    required: false
    default: '1h'
  num-masters:
    description: 'The number of master nodes in the cluster.'
    required: false
    default: 1
  worker-boot-disk-size:
    description: 'Dataproc Worker Boot disk size'
    required: false
    default: 500GB
  worker-boot-disk-type:
    description: 'Dataproc Worker Boot disk type'
    required: false
    default: pd-standard
  worker-machine-type:
    description: 'Dataproc Worker Machine type'
    required: false
    default: n1-standard-2
  zone:
    description: 'Dataproc Cluster Zone'
    required: false
    default: us-east1-b
  image-version:
    description: 'The image version to use for the cluster.'
    required: false
    default: preview-ubuntu18
  metadata:
    description: 'Metadata to be made available to the guest operating system running on the instances'
    required: true
  scopes:
    description: 'Specifies scopes for the node instances.'
    required: false
    default: https://www.googleapis.com/auth/cloud-platform
  num-workers:
    description: 'The number of worker nodes in the cluster.'
    required: false
    default: 2
  properties:
    description: 'Specifies configuration properties for installed packages, such as Hadoop and Spark.'
    required: true
  labels:
    description: 'List of label KEY=VALUE pairs to add.'
    required: false
```

### After your testing you can delete the dataproc cluster you created by running the below action.

```yaml

- name: Delete Google Cloud Dataproc cluster
  uses: vishnudxb/gcloud-dataproc-deletion@main
  with:
    cluster: "your dataproc cluster name"
    region: "Your dataproc luster region"
    project: "Your gcloud project id"

```
