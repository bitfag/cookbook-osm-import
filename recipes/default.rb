package 'osm2pgsql'
package 'wget'
package 'git'

# pseudouser for scripts task
user node['osm']['user'] do
    comment 'user for osm tasks'
    home "/home/#{node['osm']['user']}"
    manage_home true
    shell '/bin/bash'
end

# deploy osm-import-scripts
git '/opt/osm-import-scripts' do
    repository 'https://github.com/bitfag/osm-import-scripts.git'
end

link '/usr/local/bin/osm-import' do
    to '/opt/osm-import-scripts/osm-import'
end

include_recipe 'chef-vault'
item = chef_vault_item(node['osm']['bag'], node['osm']['item'])

template '/etc/osm-import.conf' do
    owner 'root'
    group node['osm']['user']
    mode '0640'
    variables :pg_host => item['pg_host'],
        :pg_port => item['pg_port'],
        :pg_database => item['pg_database'],
        :pg_user => item['pg_user']
end

template "/home/#{node['osm']['user']}/.pgpass" do
    source 'pgpass.erb'
    owner node['osm']['user']
    group node['osm']['user']
    mode '0600'
    variables :pg_host => item['pg_host'],
        :pg_port => item['pg_port'],
        :pg_database => item['pg_database'],
        :pg_user => item['pg_user'],
        :pg_pass => item['pg_pass']
end
