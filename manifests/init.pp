# = Class: dovecot
#
# This is the main dovecot class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, dovecot class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $dovecot_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, dovecot main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $dovecot_source
#
# [*source_dir*]
#   If defined, the whole dovecot configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $dovecot_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $dovecot_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, dovecot main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $dovecot_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $dovecot_options
#
# [*service_autorestart*]
#   Automatically restarts the dovecot service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $dovecot_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $dovecot_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $dovecot_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $dovecot_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for dovecot checks
#   Can be defined also by the (top scope) variables $dovecot_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $dovecot_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $dovecot_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $dovecot_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $dovecot_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for dovecot port(s)
#   Can be defined also by the (top scope) variables $dovecot_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling dovecot. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $dovecot_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $dovecot_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $dovecot_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $dovecot_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in dovecot::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of dovecot package
#
# [*service*]
#   The name of dovecot service
#
# [*service_status*]
#   If the dovecot service init script supports status argument
#
# [*process*]
#   The name of dovecot process
#
# [*process_args*]
#   The name of dovecot arguments. Used by puppi and monitor.
#   Used only in case the dovecot process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user dovecot runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $dovecot_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $dovecot_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include dovecot"
# - Call dovecot as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class dovecot (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits dovecot::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $dovecot::bool_absent ? {
    true  => 'absent',
    false => $dovecot::version,
  }

  $manage_service_enable = $dovecot::bool_disableboot ? {
    true    => false,
    default => $dovecot::bool_disable ? {
      true    => false,
      default => $dovecot::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $dovecot::bool_disable ? {
    true    => 'stopped',
    default =>  $dovecot::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $dovecot::bool_service_autorestart ? {
    true    => Service[dovecot],
    false   => undef,
  }

  $manage_file = $dovecot::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $dovecot::bool_absent == true
  or $dovecot::bool_disable == true
  or $dovecot::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $dovecot::bool_absent == true
  or $dovecot::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $dovecot::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $dovecot::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $dovecot::source ? {
    ''        => undef,
    default   => $dovecot::source,
  }

  $manage_file_content = $dovecot::template ? {
    ''        => undef,
    default   => template($dovecot::template),
  }

  ### Managed resources
  package { $dovecot::package:
    ensure  => $dovecot::manage_package,
    noop    => $dovecot::bool_noops,
  }

  service { 'dovecot':
    ensure     => $dovecot::manage_service_ensure,
    name       => $dovecot::service,
    enable     => $dovecot::manage_service_enable,
    hasstatus  => $dovecot::service_status,
    pattern    => $dovecot::process,
    require    => Package[$dovecot::package],
    noop       => $dovecot::bool_noops,
  }

  file { 'dovecot.conf':
    ensure  => $dovecot::manage_file,
    path    => $dovecot::config_file,
    mode    => $dovecot::config_file_mode,
    owner   => $dovecot::config_file_owner,
    group   => $dovecot::config_file_group,
    require => Package[$dovecot::package],
    notify  => $dovecot::manage_service_autorestart,
    source  => $dovecot::manage_file_source,
    content => $dovecot::manage_file_content,
    replace => $dovecot::manage_file_replace,
    audit   => $dovecot::manage_audit,
    noop    => $dovecot::bool_noops,
  }

  # The whole dovecot configuration directory can be recursively overriden
  if $dovecot::source_dir {
    file { 'dovecot.dir':
      ensure  => directory,
      path    => $dovecot::config_dir,
      require => Package[$dovecot::package],
      notify  => $dovecot::manage_service_autorestart,
      source  => $dovecot::source_dir,
      recurse => true,
      purge   => $dovecot::bool_source_dir_purge,
      force   => $dovecot::bool_source_dir_purge,
      replace => $dovecot::manage_file_replace,
      audit   => $dovecot::manage_audit,
      noop    => $dovecot::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $dovecot::my_class {
    include $dovecot::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $dovecot::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'dovecot':
      ensure    => $dovecot::manage_file,
      variables => $classvars,
      helper    => $dovecot::puppi_helper,
      noop      => $dovecot::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $dovecot::bool_monitor == true {
    if $dovecot::port != '' {
      monitor::port { "dovecot_${dovecot::protocol}_${dovecot::port}":
        protocol => $dovecot::protocol,
        port     => $dovecot::port,
        target   => $dovecot::monitor_target,
        tool     => $dovecot::monitor_tool,
        enable   => $dovecot::manage_monitor,
        noop     => $dovecot::bool_noops,
      }
    }
    if $dovecot::service != '' {
      monitor::process { 'dovecot_process':
        process  => $dovecot::process,
        service  => $dovecot::service,
        pidfile  => $dovecot::pid_file,
        user     => $dovecot::process_user,
        argument => $dovecot::process_args,
        tool     => $dovecot::monitor_tool,
        enable   => $dovecot::manage_monitor,
        noop     => $dovecot::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $dovecot::bool_firewall == true and $dovecot::port != '' {
    firewall { "dovecot_${dovecot::protocol}_${dovecot::port}":
      source      => $dovecot::firewall_src,
      destination => $dovecot::firewall_dst,
      protocol    => $dovecot::protocol,
      port        => $dovecot::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $dovecot::firewall_tool,
      enable      => $dovecot::manage_firewall,
      noop        => $dovecot::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $dovecot::bool_debug == true {
    file { 'debug_dovecot':
      ensure  => $dovecot::manage_file,
      path    => "${settings::vardir}/debug-dovecot",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $dovecot::bool_noops,
    }
  }

}
