#!/opt/puppetlabs/puppet/bin/ruby

require_relative '../../ruby_task_helper/files/task_helper.rb'
require_relative '../lib/service_now_request.rb'

# This task updates records
class ServiceNowUpdate < TaskHelper
  def task(table: nil,
           sys_id: nil,
           fields: nil,
           _target: nil,
           **_kwargs)

    user = _target[:user]
    password = _target[:password]
    instance = _target[:name]

    uri = "https://#{instance}.service-now.com/api/now/table/#{table}/#{sys_id}"

    request = ServiceNowRequest.new(uri, 'Patch', fields, user, password)
    request.print_response
  end
end

if $PROGRAM_NAME == __FILE__
  ServiceNowUpdate.run
end
