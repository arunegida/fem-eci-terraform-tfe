module "project" {
for_each = local.project

  source  = "ALT-F4-LLC/project/tfe"
  version = "0.5.0"

  description = each.value.description
  name=each.key
  organization_name = var.organization_name
}

module "workspace" {
  for_each = local.workspace

  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.8.0"

  name=each.key
  execution_mode=each.value.execution_mode
  description = each.value.description
  organization_name = var.organization_name
  project_id=each.value.project_id
  variables         = try(each.value.variables, [])
  // A workspace must have a repo (one to one)
  vcs_repo={
  github_app_installation_id =data.tfe_github_app_installation.this.id
  identifier=each.value.vcs_repo_identifier
  }
}





moved {

  from = module.workspace["devops-learning-workspace"]
  to = module.workspace["devops-learning-tfe"]

}
