execute 'apt update' do
  command 'apt-get update'
end

package "wget"
package "ntp"

cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
execute "ntp restart" do
  command "service ntp restart"
end

package "bundler"
execute "bundle install" do
  cwd "/home/vagrant/project/"
  # user "vagrant"
  command "bundle install"
end

execute "run debug server" do
    cwd "/home/vagrant/project/"
    user "vagrant"
    command "thin start -d"
end
