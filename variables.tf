variable "project_id" {
  description = "(Required) The ID of the project in which the the resource belongs. Must not have 'projects/' prefix"
  type        = string

  validation {
    condition     = length(regexall("(?P<prefix>projects/).*$", var.project_id)) == 0
    error_message = "The var.project_id must not containt the prefix 'projects/' as it is not consistently required for the Google Terraform Resources. The resources that may require the input in this format will use locals, in which the prefix is prepend to the var.project_id to provide the project_id in valid format for that given resource. Other resources will consume the value of var.project_id directly."
  }

  validation {
    condition = can(regex("^[a-zA-Z]{1}[a-zA-Z0-9-]{4,29}[a-zA-Z0-9]{1}$", trimspace(var.project_id)))
    error_message = "The var.project_id must be valid Project ID, that follows constraints of Google Project IDs; alpha-numerical characters, incl. hyphens, with length from 6 to 30 characters in total, starting with letter and not ending with a hyphen."
  }

  validation {
    condition = length(regexall("^.*(gcp|google|ssl).*$", lower(var.project_id))) == 0
    error_message = "The var.project id contains on or more instances of restricted strings ('google','ssl', 'gcp'). Please verify the input."
  }
}

variable "enabled" {
  description = "(Optional) Disables/Enables the feature, making the module deployment configurable."
  type        = bool
  default     = true
}
