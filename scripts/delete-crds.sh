#!/bin/bash

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
  kubectl delete clusterrolebinding $t
  kubectl delete clusterrole $t
done