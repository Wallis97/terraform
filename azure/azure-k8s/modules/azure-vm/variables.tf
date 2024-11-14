variable "rg_name" {
  type = string
  description = "Resource Group name"
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_ip_range" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_ip_range" {
  type = list(string)
}

variable "ip_config_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "username" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "sa_type" {
  type = string
}

variable "caching" {
  type = string
}