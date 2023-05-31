# @summary Open GitLab ports in the firewall
#
# @param http_allowed_subnets
#   Subnets allowed access via http port
#
# @param https_allowed_subnets
#   Subnets allowed access via https port
#
# @example
#   include profile_gitlab::firewall
class profile_gitlab::firewall (
  Hash[String,String] $http_allowed_subnets,
  Hash[String,String] $https_allowed_subnets,
) {
  $http_allowed_subnets.each | $location, $source_cidr | {
    firewall { "400 allow HTTP on tcp port 80 from ${location}":
      dport  => '80',
      proto  => tcp,
      source => $source_cidr,
      action => accept,
    }
  }

  $https_allowed_subnets.each | $location, $source_cidr | {
    firewall { "400 allow HTTPS on tcp port 443 from ${location}":
      dport  => '443',
      proto  => tcp,
      source => $source_cidr,
      action => accept,
    }
  }
}
