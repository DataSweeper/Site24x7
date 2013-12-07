#
# Cookbook Name:: Site24x7
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# path /chef-repo/cookbook/recipe/default.rb

#To intall the linux agent of  site24x7 for ubuntu 12.04 
directory "/tmp/site24x7agent" do
	mode 0777
	action :create
end

execute "curl" do
	command "sudo curl #{node[:Site24x7][:url]} > /tmp/site24x7agent/Linux_Agent_32bit.install"
	action :run
end

file "/tmp/site24x7agent/Linux_Agent_32bit.install" do 
	mode 0777
end

execute '' do
	cwd "/tmp/site24x7agent/"
	command "sudo ./Linux_Agent_32bit.install -i -key=#{node[:Site24x7][:APIkey] }"
	action :run
end

service "site24x7monagent" do
  pattern "site24x7monagent"
  action [:enable, :start]
end

