output "instance_id" {
  description = "ID de Instancia EC2"
  value       = aws_instance.example.id
}


output "instance_public_ip" {
  description = "IP Pública de Instancia EC2"
  value       = aws_instance.example.public_ip
}