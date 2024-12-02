# @summary Install and configure GitLab service
#
# @example
#   include profile_gitlab
class profile_gitlab {
  include gitlab
  include profile_gitlab::backup
  include profile_gitlab::firewall
  include profile_gitlab::ssh
  include profile_gitlab::syslog
}
