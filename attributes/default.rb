default['osm']['user'] = 'osm'

# chef-vault databag to access postgresql database credentials
default['osm']['bag'] = 'db_passwords'
default['osm']['item'] = 'osm-import'

default['osm']['dump_url'] = 'http://be.gis-lab.info/data/osm_dump/dump/latest/RU-IN.osm.pbf'
default['osm']['local_dump_path'] = '/tmp/dump.osm.pbf'

default['osm']['osm2pgsql']['cache_size'] = '3000'
default['osm']['osm2pgsql']['nproc'] = '2'
default['osm']['osm2pgsql']['custom_options'] = '--drop'
