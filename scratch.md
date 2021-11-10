export NAME="cert-manager" &&
export NAMESPACE="cert-manager" &&
export RELEASE="cert-manager" && 
export CHART="jetstack/cert-manager" &&

kubectl get helmrelease/$NAME-n $NAMESPACE -o yaml | yq .spec.values -y | helm upgrade -i $RELEASE -f - $CHART -n $NAMESPACE --set installCRDs=true


crds=(
cert-manager-cainjector                                                 
cert-manager-controller-approve:cert-manager-io                         
cert-manager-controller-certificates                                    
cert-manager-controller-certificatesigningrequests                      
cert-manager-controller-challenges                                      
cert-manager-controller-clusterissuers                                  
cert-manager-controller-ingress-shim                                    
cert-manager-controller-issuers                                         
cert-manager-controller-orders                                          
cert-manager-edit                                                       
cert-manager-view                                                       
cert-manager-webhook:subjectaccessreviews)

for t in ${crds[@]}; do
  kc delete clusterrole $t
done