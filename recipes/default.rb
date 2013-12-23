#chef-repo/site24x7/recipes/default.rb
# Cookbook Name:: Site24x7
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node["kernel"]["machine"] == "i686" || node["kernel"]["machine"] == "i386"
  package = "Site24x7_Linux_32bit.install"
else 
   package = "Site24x7_Linux_64bit.install"
end

#create a directory to hold the package temporarily
directory "/tmp/site24x7agent" do
	mode 0755                             #mode 0755
	action :create
end

execute "curl" do
  command "sudo curl https://www.site24x7.com//sagent//#{package} > /tmp/site24x7agent/#{package}"
	action :run
	end

file "/tmp/site24x7agent/#{package}" do 
	mode 0755
end

bash "site24x7_install" do
  cwd
  user "root"
 code <<-EOH
  sudo /tmp/site24x7agent/#{package} -i -key=#{node.default[:Site24x7][:APIkey]}
  EOH
 action :run
end

service "site24x7monagent" do
	action :start
end
