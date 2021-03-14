terraform {
  # Only testing with 0.14 for now
  required_version = "~> 0.14"
}

resource "null_resource" "package_build" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "dotnet build \"${path.root}/dotnet-project\""
  }
}
