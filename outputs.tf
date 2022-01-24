output "remove_me" {
  description = "Temporary output to workaround tflint 'unused' variable check. Delete from actual tf-module"
  value = {
    project_id = var.project_id
    enabled    = var.enabled
  }
}
