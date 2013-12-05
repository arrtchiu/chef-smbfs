#
# Copyright 2012, Peter Donald
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

# Copied from: https://github.com/aioi/chef-cifs/blob/master/recipes/default.rb

case node['platform']
  when 'ubuntu'
    if node['platform_version'].to_f <= 10.04
      pkg = 'smbfs'
    else
      pkg = 'cifs-utils'
    end
  else
    Chef::Log.fatal("#{node['platform']} not supported")
end

package pkg do
  action :install
end
