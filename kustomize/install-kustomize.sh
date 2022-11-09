#!/bin/bash
### install kustomize into a TAP installed cluster

export INSTALL_NAMESPACE=pkg-install

kapp deploy \
  --app pkg-install-ns \
  --file <( \
    kubectl create namespace $INSTALL_NAMESPACE \
      --dry-run=client \
      --output=yaml \
      --save-config \
    ) \
  --yes

export KUSTOMIZE_VERSION='0.24.4+vmware.1-tkg.1'

tanzu package repository \
  --namespace $INSTALL_NAMESPACE \
  add tanzu-pkg-repo \
  --url  projects.registry.vmware.com/tkg/packages/standard/repo:v1.6.0

tanzu package repository \
  --namespace $INSTALL_NAMESPACE \
  get tanzu-pkg-repo

tanzu package install kustomize \
  --namespace $INSTALL_NAMESPACE \
  --package-name fluxcd-kustomize-controller.tanzu.vmware.com\
  --version $KUSTOMIZE_VERSION\
  --values-file kustomize-values.yaml
