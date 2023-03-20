locals {

  # Resource group name
  resource_group_name = "rg${var.project}${var.location_short}${var.platform}${var.stage_short}${var.instance}"

  # AKS name
  kubernetes_cluster_name = "aks${var.project}${var.location_short}${var.platform}${var.stage_short}${var.instance}"

  # AKS node pool resource group name
  kubernetes_cluster_nodepool_name = "aksrg${var.project}${var.location_short}${var.platform}${var.stage_short}${var.instance}"
}
