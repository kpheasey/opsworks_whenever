# frozen_string_literal: true
#
# Cookbook Name:: opsworks_mspcfo
# Recipe:: whenever
#

node[:deploy].each do |application, deploy|
  deploy = node['defaults'].merge(deploy)

  dir = File.join('/', 'srv', 'www', application, 'current')
  roles = " --roles #{deploy['whenever']['roles'].join(',')}"
  code = "bundle exec whenever --set environment=#{deploy['global']['environment']} --update-crontab #{application} #{roles}"

  bash "update-crontab-#{application}" do
    cwd dir
    user 'deploy'
    code code
    only_if "cd #{dir} && bundle show whenever"
  end
end