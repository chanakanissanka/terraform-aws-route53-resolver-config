variable "security_group_id" {
  default = "sg-0bcf6fabd2f3c2b68"
}
variable "vpc_id" {}

variable "rules" {
  default = []
  type = list(any)

}
