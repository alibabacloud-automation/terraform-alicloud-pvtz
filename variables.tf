variable "create_zone" {
  description = "Whether to create a new Private Zone."
  type        = bool
  default     = true
}

variable "existing_zone_id" {
  description = "The ID of an existing Private Zone to use when create_zone is false."
  type        = string
  default     = null
}

variable "domain_name" {
  description = "The domain name of the Private Zone."
  type        = string
}

variable "remark" {
  description = "The remark of the Private Zone."
  type        = string
  default     = null
}

variable "resource_group_id" {
  description = "The ID of the resource group."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "vpc_ids" {
  description = "A list of VPC IDs to attach to the Private Zone."
  type = list(object({
    vpc_id    = string
    region_id = optional(string, null)
  }))
  default = []
}

variable "dns_records" {
  description = "A map of DNS records to create in the Private Zone. The key is a unique identifier for each record."
  type = map(object({
    type     = string
    name     = string
    value    = string
    ttl      = optional(number, 60)
    priority = optional(number, null)
    status   = optional(string, "ENABLE")
  }))
  default = {}
}
