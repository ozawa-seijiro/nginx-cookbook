package 'nginx' do
  action :install
end

service 'nginx' do
  supports:status=>true,:restart=> true,:reload=>true
  action [:enable, :start]
end

template 'default.conf' do
  path "/etc/nginx/conf.d/default.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]"
end

