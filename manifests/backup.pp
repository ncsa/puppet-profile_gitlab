# @summary Configure GitLab backups
#
# @example
#   include profile_gitlab::backup
class profile_gitlab::backup {

  cron { 'GITLAB DAILY BACKUPS':
    command => '/opt/gitlab/bin/gitlab-backup create CRON=1',
    user    => 'root',
    hour    => 4,
    minute  => 0,
    weekday => [
      '2',
      '4',
      '6',
    ],
  }

  $backup_paths = '/etc/gitlab/config_backup/ /var/opt/gitlab/backups/'
  cron { 'GITLAB CLEANUP BACKUPS':
    command => "/usr/bin/find ${backup_paths} \\( -name '*.tar' \\) -mtime +7 -type f -exec rm -rf {} \\;",
    user    => 'root',
    special => 'daily',
  }

}
