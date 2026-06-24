output "master_instance_id" {
    value = module.ec2_master.instance_id
}

output "workers_instance_ids" {
    value = module.ec2_workers[*].instance_id
}

output "master_public_ip" {
    value = module.ec2_master.public_ip
}

output "workers_public_ip" {
    value = module.ec2_workers[*].public_ip
}



output "s3_bucket_name" {
    value = module.s3_bucket.bucket_name
}

