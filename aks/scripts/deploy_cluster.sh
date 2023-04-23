#!/bin/bash

# Get commandline arguments
while (( "$#" )); do
  case "$1" in
    --destroy)
      flagDestroy="true"
      shift
      ;;
    --dry-run)
      flagDryRun="true"
      shift
      ;;
    *)
      shift
      ;;
  esac
done

###################
### Infra Setup ###
###################

### Set parameters
project="nr1"
locationLong="westeurope"
locationShort="euw"
platform="platform"
stageLong="dev"
stageShort="d"
instance="001"
kubernetesVersion="1.25.5"

### Set variables
resourceGroupName="rg${project}${locationShort}${platform}${stageShort}${instance}"
aksName="aks${project}${locationShort}${platform}${stageShort}${instance}"

if [[ $flagDestroy != "true" ]]; then

  # Initialise Terraform
  terraform -chdir=../terraform init

  # Plan Terraform
  terraform -chdir=../terraform plan \
    -var project=$project \
    -var location_long=$locationLong \
    -var location_short=$locationShort \
    -var stage_short=$stageShort \
    -var stage_long=$stageLong \
    -var instance=$instance \
    -var kubernetes_version=$kubernetesVersion \
    -out "./tfplan"

    if [[ $flagDryRun != "true" ]]; then
    
      # Apply Terraform
      terraform -chdir=../terraform apply tfplan

      # Get AKS credentials
      az aks get-credentials \
        --resource-group $resourceGroupName \
        --name $aksName \
        --overwrite-existing
    fi
else

  # Destroy resources
  terraform -chdir=../terraform destroy \
    -var project=$project \
    -var location_long=$locationLong \
    -var location_short=$locationShort \
    -var stage_short=$stageShort \
    -var stage_long=$stageLong \
    -var instance=$instance \
    -var kubernetes_version=$kubernetesVersion
fi
#########