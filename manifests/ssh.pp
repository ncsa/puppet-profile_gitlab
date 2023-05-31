# @summary Configure ssh access to GitLab for git clients
#
# @param allowed_subnets
#   List of subnets allowed SSH access
#
# @example
#   include profile_gitlab::ssh
class profile_gitlab::ssh (
  Array[String] $allowed_subnets,
) {
  $params = {
    'AuthenticationMethods' => 'publickey',
    'MaxAuthTries'          => '6',
    'PubkeyAuthentication'  => 'yes',
  }

  ::sshd::allow_from { 'sshd allow git user for GitLab':
    hostlist                => $allowed_subnets,
    users                   => ['git'],
    groups                  => ['git'],
    additional_match_params => $params,
  }

  # ALSO NEED access.conf ENTRY FOR ORIGIN 'ALL EXCEPT LOCAL'
  # pam_access DOES NOT ALLOW FOR 'ALL EXCEPT LOCAL' SO USING 2 SETS OF ENTRIES
  pam_access::entry { 'Disallow group git access from LOCAL':
    group      => 'git',
    origin     => 'LOCAL',
    permission => '-',
    position   => 'before',
  }
  pam_access::entry { 'Disallow user git access from LOCAL':
    user       => 'git',
    origin     => 'LOCAL',
    permission => '-',
    position   => 'before',
  }
  pam_access::entry { 'Allow group git access from ALL':
    group      => 'git',
    origin     => 'ALL',
    permission => '+',
    position   => '-1',
  }
  pam_access::entry { 'Allow user git access from ALL':
    user       => 'git',
    origin     => 'ALL',
    permission => '+',
    position   => '-1',
  }
}
