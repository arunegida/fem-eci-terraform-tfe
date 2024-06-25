locals{
project={
"devops-learning-project"={
description = "Learning Projects Terraform"
}
}

workspace = {
  "devops-learning-tfe"={
      execution_mode="remote"
      description = "Learning Workspace Terraform"
      project_id=module.project["devops-learning-project"].id
      vcs_repo_identifier="${var.github_organization_name}/fem-eci-terraform-tfe"
}
  "devops-learning-github"={
      execution_mode="remote"
      description = "Learning Workspace Terraform"
      project_id=module.project["devops-learning-project"].id
      vcs_repo_identifier="${var.github_organization_name}/fem-eci-terraform-github"
}
}
}
