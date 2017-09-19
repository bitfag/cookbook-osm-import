# # encoding: utf-8

# Inspec test for recipe osm-import::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


describe file('/usr/local/osm-import-scripts/osm-import') do
    it { should be_file }
    its('size') { should > 64 }
end

describe file('/etc/osm-import.conf') do
    it { should be_file }
    its('size') { should > 64 }
end

describe file('/home/osm/.pgpass') do
    it { should be_file }
    its('size') { should > 10 }
end


