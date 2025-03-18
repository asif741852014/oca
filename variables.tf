variable "vpccidr" {
    default ="10.0.0.0/16"
}


variable "vpcname" {
    default ="eksvpc"
}

variable "igw" {
    default = "igw16"
}

variable "subnetcidr_az1" {
    default = "10.0.1.0/24"
}

variable "subnetcidr_az2" {
    default = "10.0.2.0/24"
}

variable "instance_size" {
    default = "t2.medium"
}

variable "cluster_name" {
    default = "aws-eks"
}

variable "instance_count" {
    default = 2
}