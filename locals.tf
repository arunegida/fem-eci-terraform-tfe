locals{
project={
"devops-learning-project"={
description = "Learning Projects Terraform"
}
}

workspace = {
  "devops-learning-tfe"={

  execution_mode="local"
  description = "Learning Workspace Terraform"
project_id=module.project["devops-learning-project"].id

}
}

}
