export NAME="cert-manager" &&
export NAMESPACE="cert-manager" &&
export RELEASE="cert-manager" && 
export CHART="jetstack/cert-manager" &&

export NAME="external-dns" &&
export NAMESPACE="external-dns" &&
export RELEASE="external-dns" && 
export CHART="bitnami/external-dns" &&

kubectl get helmrelease/$NAME-n $NAMESPACE -o yaml | yq .spec.values -y | helm upgrade -i $RELEASE -f - $CHART -n $NAMESPACE #--set installCRDs=true


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


eksctl create iamserviceaccount \
--override-existing-serviceaccounts \
--name=kustomize-controller \
--namespace=flux-system \
--attach-role-arn="arn:aws:iam::602955111154:role/aws-service-role/cks.kms.amazonaws.com/AWSServiceRoleForKeyManagementServiceCustomKeyStores" \
--cluster=dev-gitlab