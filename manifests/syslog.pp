# @summary Configure syslog related to GitLab
#
# @param path
#   Path to GitLab logs
#
# @example
#   include profile_gitlab::syslog
class profile_gitlab::syslog (
  String $path,
) {
  include rsyslog

  # Define the rsyslog module
  rsyslog::component::module { 'imfile':
    confdir  => $rsyslog::confdir,
    priority => $rsyslog::module_load_priority,
    target   => '75_gitlab.conf',
  }

  Rsyslog::Component::Input {
    confdir  => $rsyslog::confdir,
    priority => $rsyslog::input_priority,
    target   => '75_gitlab.conf',
    type     => 'imfile',
  }

  $rsyslog_input_default_params = {
    facility => 'local0',
    severity => 'info',
  }

  # Define the rsyslog inputs dynamically
  $gitlab_logs = [
    { file => "${profile_gitlab::syslog::path}/nginx/gitlab_access.log", tag => 'gitlab-access' },
    { file => "${profile_gitlab::syslog::path}/gitaly/current", tag => 'gitlab-gitaly' },
    { file => "${profile_gitlab::syslog::path}/gitlab-pages/current", tag => 'gitlab-pages' },
    { file => "${profile_gitlab::syslog::path}/registry/current", tag => 'gitlab-registry' },
    { file => "${profile_gitlab::syslog::path}/gitlab-shell/gitlab-shell.log", tag => 'gitlab-shell' },
    { file => "${profile_gitlab::syslog::path}/sidekiq/current", tag => 'gitlab-sidekiq' },
    { file => "${profile_gitlab::syslog::path}/gitlab-workhorse/current", tag => 'gitlab-workhorse' },
  ]
  $gitlab_logs.each |$log| {
    rsyslog::component::input { $log['tag']:
      config => merge($rsyslog_input_default_params, {
          file => $log['file'],
          tag  => $log['tag'],
      }),
    }
  }
}
