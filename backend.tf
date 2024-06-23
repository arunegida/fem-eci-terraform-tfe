terraform {
  cloud {
    organization = "devops-learning-arun"

    workspaces {
      name = "devops-learning-tfe"
    }
  }
}
