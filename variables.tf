variable "django_debug" {
    description = "Set django to debug mode"
    type = bool
}
variable "django_secret_key" {
    description = "Secret key for django app"
    type = string
    sensitive = true
}

variable "docker_username" {
    description = "Username for docker login"
    type = string
    sensitive = true
}
variable "docker_token" {
    description = "Token for docker login"
    type = string
    sensitive = true
}