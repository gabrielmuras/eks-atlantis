variable "namespace" {
  description = "Namespace"
  type        = string
  default     = "atlantis"

}

variable "name" {
  description = "Name"
  type        = string
  default     = "atlantis"
}

variable "chart" {
  description = "Chart"
  type        = string
  default     = "atlantis"

}

variable "repository" {
  description = "Repository"
  type        = string
  default     = "https://runatlantis.github.io/helm-charts"

}

variable "chart_version" {
  description = "Version"
  type        = string
  default     = "5.4.0"

}

variable "orgAllowlist" {
  description = "Organization allowlist"
  type        = string

}
variable "atlantisDataDirectory" {
  description = "Atlantis data directory"
  type        = string

}

variable "ingress_annotations_class" {
  description = "Ingress annotations"
  type        = string
}

variable "ingress_annotations_type" {
  description = "Ingress annotations"
  type        = string
}

variable "ingress_annotations_subnet" {
  description = "Ingress annotations"
  type        = string
}

variable "github_user" {
  description = "GitHub user"
  type        = string
  sensitive   = true

}

variable "github_token" {
  description = "GitHub token"
  type        = string
  sensitive   = true
}

variable "github_webhook_secret" {
  description = "GitHub webhook secret"
  type        = string

}

variable "atlantis_aws_access_key_id" {
  description = "Atlantis access key id"
  type        = string
  sensitive   = true

}

variable "atlantis_aws_secret_access_key" {
  description = "Atlantis secret access key"
  type        = string
  sensitive   = true
}