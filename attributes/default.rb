default['logstash']['basedir'] = '/opt/logstash'
default['logstash']['user'] = 'logstash'
default['logstash']['group'] = 'logstash'
default['logstash']['join_groups'] = []
default['logstash']['log_dir'] = '/var/log/logstash'
default['logstash']['pid_dir'] = '/var/run/logstash'
default['logstash']['create_account'] = true

# roles/flags for various search/discovery
default['logstash']['graphite_role'] = 'graphite_server'
default['logstash']['graphite_query'] = "roles:#{node['logstash']['graphite_role']} AND chef_environment:#{node.chef_environment}"
default['logstash']['elasticsearch_role'] = 'logstash_elasticsearch_master'
default['logstash']['elasticsearch_query'] = "roles:#{node['logstash']['elasticsearch_role']} AND chef_environment:#{node.chef_environment} AND tags:#{node.tags[0]}"
default['logstash']['elasticsearch_cluster'] = 'logstash'
default['logstash']['elasticsearch_ip'] = ''
default['logstash']['elasticsearch_port'] = ''
default['logstash']['graphite_ip'] = ''

default['logstash']['patterns'] = {}
default['logstash']['install_zeromq'] = false

case
when platform_family?("rhel")
  node.set['logstash']['zeromq_packages'] = [ "zeromq",  "zeromq-devel"]
when platform_family?("debian")
  node.set['logstash']['zeromq_packages'] = [ "zeromq",  "libzmq-dev"]
end
