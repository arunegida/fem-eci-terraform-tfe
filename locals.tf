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
    
    "fem-eci-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci"
        },
      ]
    }

    "fem-eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "arun.com"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci-arun"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "fem-eci"
        },
      ]
    }
}
}
