# @summary Configure GitLab backups
#
# @example
#   include profile_gitlab::backup
class profile_gitlab::backup {
  if ( lookup('profile_backup::client::enabled') ) {
    include profile_backup::client

    profile_backup::client::add_job { 'profile_gitlab':
      paths             => [
        '/etc/gitlab',
        '/var/opt/gitlab/backups',
      ],
      prehook_commands  => [
        '/opt/gitlab/bin/gitlab-backup create CRON=1',
      ],
      posthook_commands => [
        "find /etc/gitlab/config_backup \\( -name '*.tar' \\) -mtime +30 -type f -exec rm -rf {} \\;",
        "find /var/opt/gitlab/backups \\( -name '*.tar' \\) -mtime +2 -type f -exec rm -rf {} \\;",
      ],
    }

    # REMOVE OLD BACKUP CRONS FROM <= v0.1.1 OF THIS MODULE
    # THIS LOGIC CAN BE REMOVED IN FUTURE VERSIONS OF THIS MODULE
    cron { 'GITLAB DAILY BACKUPS':
      ensure => 'absent',
    }
    cron { 'GITLAB CLEANUP BACKUPS':
      ensure => 'absent',
    }
  }
}
