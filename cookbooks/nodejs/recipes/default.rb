#
# Author:: Marius Ducea (marius@promethost.com) and Semmy Purewal (semmypurewal@gmail.com)
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2010, Promet Solutions
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

path = node[:nodejs][:version]>"0.5.0"?
            "http://nodejs.org/dist/v#{node[:nodejs][:version]}/":
            "http://nodejs.org/dist/"

if node[:nodejs][:from_source] == true or node[:nodejs][:version] < "0.8.6"
  include_recipe "build-essential"

  case node[:platform]
    when "centos","redhat","fedora"
      package "openssl-devel"
    when "debian","ubuntu"
      package "libssl-dev"
  end

  bash "install nodejs from source" do
    cwd "/usr/local/src"
    user "root"
    code <<-EOH
      wget #{path}node-v#{node[:nodejs][:version]}.tar.gz && \
      tar zxf node-v#{node[:nodejs][:version]}.tar.gz && \
      cd node-v#{node[:nodejs][:version]} && \
      ./configure --prefix=#{node[:nodejs][:dir]} && \
      make && \
      make install
    EOH
    not_if "#{node[:nodejs][:dir]}/bin/node -v 2>&1 | grep 'v#{node[:nodejs][:version]}'"
  end

  if node[:nodejs][:version] < "0.6.3"
    package "curl"

    bash "install npm" do
      cwd "/usr/local/src"
      user "root"
      cwd "/tmp/"	
      code <<-EOH
        curl https://npmjs.org/install.sh | clean=no sh    
      EOH
      not_if "#{node[:nodejs][:dir]}/bin/npm -v 2>&1 | grep '#{node[:nodejs][:npm]}'"
    end
  end

else

  bash "install nodejs binary" do
    cwd "/opt"
    user "root"
    code <<-EOH
      wget #{path}node-v#{node[:nodejs][:version]}-linux-x86.tar.gz && \
      tar zxf node-v#{node[:nodejs][:version]}-linux-x86.tar.gz && \
      ln -s /opt/node-v#{node[:nodejs][:version]}-linux-x86/bin/node /usr/local/bin/node && \
      ln -s /opt/node-v#{node[:nodejs][:version]}-linux-x86/bin/node-waf /usr/local/bin/node-waf && \
      ln -s /opt/node-v#{node[:nodejs][:version]}-linux-x86/bin/npm /usr/local/bin/npm
    EOH
    not_if "/opt/node-v#{node[:nodejs][:version]}-linux-x86/bin/node -v | grep 'v#{node[:nodejs][:version]}'"
  end


end
