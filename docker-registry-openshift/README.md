Docker Registry on OpenShift

```
oc new-project cpd-ireg
oc apply -f cpd-ireg-svc.yaml
oc apply -f cpd-ireg-pvc.yaml
htpasswd -Bbn reguser regpassword >cpd-ireg-htpasswd
oc create secret generic cpd-ireg-htpasswd --from-file=htpasswd=cpd-ireg-htpasswd
oc apply -f cpd-ireg-depl.yaml
```

```
oc create route passthrough cpd-ireg --service=cpd-ireg
oc edit route cpd-ireg  # Edit hostname
```

```
podman login --tls-verify=false cpd-ireg.apps.publicocp.ibmcc.ru
podman pull registry:2
podman image tag registry:2 cpd-ireg.apps.publicocp.ibmcc.ru/registry:2
podman push --tls-verify=false cpd-ireg.apps.publicocp.ibmcc.ru/registry:2
```
