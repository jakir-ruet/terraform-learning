# Using list in for loop
output "forloop_output_list" {
  description = "List in for loop"
  value       = [for instance in aws_instance.aws_instance.example_list : instance.public_dns]
}

# Using map in for loop
output "forloop_output_map" {
  description = "List in for loop"
  value       = { for instance in aws_instance.aws_instance.example_map : instance.id => instance.public_dns }
}

# Using advance map in for loop
output "forloop_output_map_advance" {
  description = "List in for loop advance"
  value       = { for count_number, instance in aws_intrance.aws_instance.example_map : count_number => instance.public_dns }
}

# Using advance list in legacy splat operator (*), list return
output "legacy_splat_instance_instancedns" {
  description = "Legacy Splat Operator"
  value       = aws_instance.example_list.example_list.*.public_dns
}

# Using list in generalized splat operator [*], list return
output "generalized_splat_instance_instancedns" {
  description = "generalized Splat Operator"
  value       = aws_instance.example_list.example_list[*].public_dns
}

# Using map in legacy splat operator (*), map return
output "legacy_splat_instance_instancedns" {
  description = "Legacy Splat Operator"
  value       = aws_instance.example_list.example_map.*.public_dns
}

# Using map in generalized splat operator [*], map return
output "generalized_splat_instance_instancedns" {
  description = "generalized Splat Operator"
  value       = aws_instance.example_list.example_map[*].public_dns
}
