### Variables ###

## General

# project
variable "project" {
  type    = string
  default = "nr1"
}

# location_long
variable "location_long" {
  type    = string
  default = "westeurope"
}

# location_short
variable "location_short" {
  type    = string
  default = "euw"
}

# stage_long
variable "stage_long" {
  type    = string
  default = "dev"
}

# stage_short
variable "stage_short" {
  type    = string
  default = "d"
}

# instance
variable "instance" {
  type    = string
  default = "001"
}

# platform
variable "platform" {
  type    = string
  default = "platform"
}

# k8s version
variable "kubernetes_version" {
  type    = string
  default = "1.25.5"
}

