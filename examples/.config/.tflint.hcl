plugin "google" {
    enabled = false
    version = "0.15.0"
    source  = "github.com/terraform-linters/tflint-ruleset-google"
}

rule "terraform_comment_syntax" {
  enabled = false
}

rule "terraform_deprecated_index" {
  enabled = false
}

rule "terraform_deprecated_interpolation" {
  enabled = false
}

rule "terraform_documented_outputs" {
  enabled = false
}

rule "terraform_documented_variables" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = false
  style = "flexible"
  default_branches = ["main"]
}

rule "terraform_module_version" {
  enabled = false
}

rule "terraform_naming_convention" {
  enabled = false
  format = "snake_case"
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_standard_module_structure" {
  enabled = false
}

rule "terraform_typed_variables" {
  enabled = false
}

rule "terraform_unused_declarations" {
  enabled = false
}

rule "terraform_unused_required_providers" {
  enabled = false
}

rule "terraform_workspace_remote" {
  enabled = false
}
