tanzu package installed delete kustomize -n pkg-install --yes
kapp delete -a tanzu-pkg-repo-ctrl -n pkg-install --yes
kapp delete -a pkg-install-ns --yes
