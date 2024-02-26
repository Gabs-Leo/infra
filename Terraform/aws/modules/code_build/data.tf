data "local_file" "buildspec_local" {
    filename = "${path.module}/config/buildspec.yml"
}