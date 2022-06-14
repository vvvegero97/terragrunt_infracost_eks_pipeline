output "sg_ids" {
  description = "SG ID"
  value = [
    "${aws_security_group.worker_group_mgmt_one.id}",
    "${aws_security_group.worker_group_mgmt_two.id}",
  ]
}
