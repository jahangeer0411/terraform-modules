output "region" {
    value = var.region
}
output "project_name" {
    value = var.project_name
}
output "vpc_id" {
    value = aws_vpc.myvpc.id
}
output "public_subnet" {
    value = aws_subnet.public.id
}
output "private_subnet" {
    value = aws_subnet.private.id
}
output "aws_internet_gateway" {
    value = aws_internet_gateway.myigw.id
}
