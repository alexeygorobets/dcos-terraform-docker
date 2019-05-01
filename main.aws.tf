data "http" "whatismyip" {
  url = "http://whatismyip.akamai.com/"
}

locals {
  admin_ips = "${split(" ", var.admin_ips == "" ? "${data.http.whatismyip.body}/32" : var.admin_ips)}"

  empty_dcos_license_key_file = "${path.module}/empty_ee_license_file.txt"
  dcos_license_key_file       = "${var.dcos_license_key_file == "" ? local.empty_dcos_license_key_file : var.dcos_license_key_file}"

  dcos_license_key_contents = "${var.dcos_license_key_contents != "" ? var.dcos_license_key_contents : file(local.dcos_license_key_file)}"
}

provider "aws" {
  region = "${var.aws_region}"
}

module "dcos" {
  source  = "dcos-terraform/dcos/aws"
  version = "__DCOS_TERRAFORM_MODULE_VERSION__"

  providers = {
    aws = "aws"
  }

  # Main Variables
  dcos_variant = "${var.dcos_variant}"

  bootstrap_private_ip = "${var.bootstrap_private_ip}"

  dcos_install_mode = "${var.dcos_install_mode}"

  dcos_version = "${var.dcos_version}"

  dcos_security = "${var.dcos_security}"

  dcos_resolvers = "${local.dcos_resolvers}"

  dcos_skip_checks = "${var.dcos_skip_checks}"

  dcos_oauth_enabled = "${var.dcos_oauth_enabled}"

  dcos_master_external_loadbalancer = "${var.dcos_master_external_loadbalancer}"

  dcos_master_discovery = "${var.dcos_master_discovery}"

  dcos_aws_template_storage_bucket = "${var.dcos_aws_template_storage_bucket}"

  dcos_aws_template_storage_bucket_path = "${var.dcos_aws_template_storage_bucket_path}"

  dcos_aws_template_storage_region_name = "${var.dcos_aws_template_storage_region_name}"

  dcos_aws_template_upload = "${var.dcos_aws_template_upload}"

  dcos_aws_template_storage_access_key_id = "${var.dcos_aws_template_storage_access_key_id}"

  dcos_aws_template_storage_secret_access_key = "${var.dcos_aws_template_storage_secret_access_key}"

  dcos_exhibitor_storage_backend = "${var.dcos_exhibitor_storage_backend}"

  dcos_exhibitor_zk_hosts = "${var.dcos_exhibitor_zk_hosts}"

  dcos_exhibitor_zk_path = "${var.dcos_exhibitor_zk_path}"

  dcos_aws_access_key_id = "${var.dcos_aws_access_key_id}"

  dcos_aws_region = "${var.dcos_aws_region}"

  dcos_aws_secret_access_key = "${var.dcos_aws_secret_access_key}"

  dcos_exhibitor_explicit_keys = "${var.dcos_exhibitor_explicit_keys}"

  dcos_s3_bucket = "${var.dcos_s3_bucket}"

  dcos_s3_prefix = "${var.dcos_s3_prefix}"

  dcos_exhibitor_azure_account_name = "${var.dcos_exhibitor_azure_account_name}"

  dcos_exhibitor_azure_account_key = "${var.dcos_exhibitor_azure_account_key}"

  dcos_exhibitor_azure_prefix = "${var.dcos_exhibitor_azure_prefix}"

  dcos_exhibitor_address = "${var.dcos_exhibitor_address}"

  num_of_public_agents = "${var.num_of_public_agents}"

  num_of_private_agents = "${var.num_of_private_agents}"

  dcos_num_masters = "${var.dcos_num_masters}"

  dcos_customer_key = "${var.dcos_customer_key}"

  dcos_rexray_config_method = "${var.dcos_rexray_config_method}"

  dcos_rexray_config_filename = "${var.dcos_rexray_config_filename}"

  dcos_adminrouter_tls_1_0_enabled = "${var.dcos_adminrouter_tls_1_0_enabled}"

  dcos_adminrouter_tls_1_1_enabled = "${var.dcos_adminrouter_tls_1_1_enabled}"

  dcos_adminrouter_tls_1_2_enabled = "${var.dcos_adminrouter_tls_1_2_enabled}"

  dcos_adminrouter_tls_cipher_suite = "${var.dcos_adminrouter_tls_cipher_suite}"

  dcos_auth_cookie_secure_flag = "${var.dcos_auth_cookie_secure_flag}"

  dcos_bouncer_expiration_auth_token_days = "${var.dcos_bouncer_expiration_auth_token_days}"

  dcos_superuser_password_hash = "${var.dcos_superuser_password_hash}"

  dcos_cluster_name = "${var.dcos_cluster_name}"

  dcos_ca_certificate_chain_path = "${var.dcos_ca_certificate_chain_path}"

  dcos_ca_certificate_path = "${var.dcos_ca_certificate_path}"

  dcos_ca_certificate_key_path = "${var.dcos_ca_certificate_key_path}"

  dcos_config = "${var.dcos_config}"

  dcos_custom_checks = "${var.dcos_custom_checks}"

  dcos_dns_bind_ip_blacklist = "${var.dcos_dns_bind_ip_blacklist}"

  dcos_enable_gpu_isolation = "${var.dcos_enable_gpu_isolation}"

  dcos_fault_domain_detect_contents = "${var.dcos_fault_domain_detect_contents}"

  dcos_fault_domain_enabled = "${var.dcos_fault_domain_enabled}"

  dcos_gpus_are_scarce = "${var.dcos_gpus_are_scarce}"

  dcos_l4lb_enable_ipv6 = "${var.dcos_l4lb_enable_ipv6}"

  dcos_license_key_contents = "${local.dcos_license_key_contents}"

  dcos_mesos_container_log_sink = "${var.dcos_mesos_container_log_sink}"

  dcos_mesos_dns_set_truncate_bit = "${var.dcos_mesos_dns_set_truncate_bit}"

  dcos_mesos_max_completed_tasks_per_framework = "${var.dcos_mesos_max_completed_tasks_per_framework}"

  dcos_ucr_default_bridge_subnet = "${var.dcos_ucr_default_bridge_subnet}"

  dcos_superuser_username = "${var.dcos_superuser_username}"

  dcos_telemetry_enabled = "${var.dcos_telemetry_enabled}"

  dcos_zk_super_credentials = "${var.dcos_zk_super_credentials}"

  dcos_zk_master_credentials = "${var.dcos_zk_master_credentials}"

  dcos_zk_agent_credentials = "${var.dcos_zk_agent_credentials}"

  dcos_overlay_enable = "${var.dcos_overlay_enable}"

  dcos_overlay_config_attempts = "${var.dcos_overlay_config_attempts}"

  dcos_overlay_mtu = "${var.dcos_overlay_mtu}"

  dcos_overlay_network = "${var.dcos_overlay_network}"

  dcos_dns_search = "${var.dcos_dns_search}"

  dcos_dns_forward_zones = "${var.dcos_dns_forward_zones}"

  dcos_master_dns_bindall = "${var.dcos_master_dns_bindall}"

  dcos_use_proxy = "${var.dcos_use_proxy}"

  dcos_http_proxy = "${var.dcos_http_proxy}"

  dcos_https_proxy = "${var.dcos_https_proxy}"

  dcos_no_proxy = "${var.dcos_no_proxy}"

  dcos_check_time = "${var.dcos_check_time}"

  dcos_docker_remove_delay = "${var.dcos_docker_remove_delay}"

  dcos_audit_logging = "${var.dcos_audit_logging}"

  dcos_gc_delay = "${var.dcos_gc_delay}"

  dcos_log_directory = "${var.dcos_log_directory}"

  dcos_process_timeout = "${var.dcos_process_timeout}"

  dcos_cluster_docker_credentials = "${var.dcos_cluster_docker_credentials}"

  dcos_cluster_docker_credentials_dcos_owned = "${var.dcos_cluster_docker_credentials_dcos_owned}"

  dcos_cluster_docker_credentials_write_to_etc = "${var.dcos_cluster_docker_credentials_write_to_etc}"

  dcos_cluster_docker_credentials_enabled = "${var.dcos_cluster_docker_credentials_enabled}"

  dcos_master_list = "${var.dcos_master_list}"

  dcos_public_agent_list = "${var.dcos_public_agent_list}"

  dcos_previous_version = "${var.dcos_previous_version}"

  dcos_previous_version_master_index = "${var.dcos_previous_version_master_index}"

  dcos_agent_list = "${var.dcos_agent_list}"

  dcos_bootstrap_port = "${var.dcos_bootstrap_port}"

  dcos_ip_detect_public_filename = "${var.dcos_ip_detect_public_filename}"

  dcos_ip_detect_public_contents = "${var.dcos_ip_detect_public_contents}"

  dcos_ip_detect_contents = "${var.dcos_ip_detect_contents}"

  dcos_rexray_config = "${var.dcos_rexray_config}"

  dcos_cluster_docker_registry_url = "${var.dcos_cluster_docker_registry_url}"

  custom_dcos_download_path = "${var.custom_dcos_download_path}"

  dcos_cluster_docker_registry_enabled = "${var.dcos_cluster_docker_registry_enabled}"

  dcos_enable_docker_gc = "${var.dcos_enable_docker_gc}"

  dcos_staged_package_storage_uri = "${var.dcos_staged_package_storage_uri}"

  dcos_package_storage_uri = "${var.dcos_package_storage_uri}"

  cluster_name = "${var.cluster_name}"

  aws_key_name = "${var.aws_key_name}"

  ssh_public_key = "${var.ssh_public_key}"

  ssh_public_key_file = "${var.ssh_public_key_file}"

  num_masters = "${var.num_masters}"

  num_private_agents = "${var.num_private_agents}"

  num_public_agents = "${var.num_public_agents}"

  tags = "${var.tags}"

  admin_ips = "${local.admin_ips}"

  availability_zones = "${var.availability_zones}"

  aws_ami = "${var.aws_ami}"

  dcos_instance_os = "${var.dcos_instance_os}"

  bootstrap_aws_ami = "${var.bootstrap_aws_ami}"

  bootstrap_os = "${var.bootstrap_os}"

  bootstrap_root_volume_size = "${var.bootstrap_root_volume_size}"

  bootstrap_root_volume_type = "${var.bootstrap_root_volume_type}"

  bootstrap_instance_type = "${var.bootstrap_instance_type}"

  bootstrap_iam_instance_profile = "${var.bootstrap_iam_instance_profile}"

  bootstrap_associate_public_ip_address = "${var.bootstrap_associate_public_ip_address}"

  masters_aws_ami = "${var.masters_aws_ami}"

  masters_os = "${var.masters_os}"

  masters_root_volume_size = "${var.masters_root_volume_size}"

  masters_instance_type = "${var.masters_instance_type}"

  masters_iam_instance_profile = "${var.masters_iam_instance_profile}"

  masters_associate_public_ip_address = "${var.masters_associate_public_ip_address}"

  private_agents_aws_ami = "${var.private_agents_aws_ami}"

  private_agents_os = "${var.private_agents_os}"

  private_agents_root_volume_size = "${var.private_agents_root_volume_size}"

  private_agents_root_volume_type = "${var.private_agents_root_volume_type}"

  private_agents_extra_volumes = "${var.private_agents_extra_volumes}"

  private_agents_instance_type = "${var.private_agents_instance_type}"

  private_agents_iam_instance_profile = "${var.private_agents_iam_instance_profile}"

  private_agents_associate_public_ip_address = "${var.private_agents_associate_public_ip_address}"

  public_agents_aws_ami = "${var.public_agents_aws_ami}"

  public_agents_os = "${var.public_agents_os}"

  public_agents_root_volume_size = "${var.public_agents_root_volume_size}"

  public_agents_root_volume_type = "${var.public_agents_root_volume_type}"

  public_agents_instance_type = "${var.public_agents_instance_type}"

  public_agents_iam_instance_profile = "${var.public_agents_iam_instance_profile}"

  public_agents_associate_public_ip_address = "${var.public_agents_associate_public_ip_address}"

  public_agents_additional_ports = "${var.public_agents_additional_ports}"

  public_agents_access_ips = "${var.public_agents_access_ips}"

  cluster_name_random_string = "${var.cluster_name_random_string}"

  subnet_range = "${var.subnet_range}"
}
