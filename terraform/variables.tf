# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "name" {
  default = "blocks57"
}

locals {
  cluster_name = "${var.name}-eks"
}