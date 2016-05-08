# auditd
default['auditd']['ruleset'] = 'default.rules'

# login defs
default['login_defs'] = {
  'MAIL_DIR' => '/var/spool/mail',
  'PASS_MAX_DAYS' => '99999',
  'PASS_MIN_DAYS' => '0',
  'PASS_MIN_LEN' => '12',
  'PASS_WARN_AGE' => '7',
  'UID_MIN' => '1000',
  'UID_MAX' => '9999',
  'SYS_UID_MIN' => '201',
  'SYS_UID_MAX' => '999',
  'GID_MIN' => '1000',
  'GID_MAX' => '9999',
  'SYS_GID_MIN' => '201',
  'SYS_GID_MAX' => '999',
  'CREATE_HOME' => 'yes',
  'UMASK' => '077',
  'USERGROUPS_ENAB' => 'yes',
  'ENCRYPT_METHOD' => 'SHA512'
}

# nfs
default['sysconfig']['nfs'] = {
  'RQUOTAD_PORT' => '875',
  'LOCKD_TCPPORT' => '32803',
  'LOCKD_UDPPORT' => '32769',
  'MOUNTD_PORT' => '892',
  'STATD_PORT' => '662',
  'STATD_OUTGOING_PORT' => '2020',
  'RDMA_PORT' => '20049'
}

# ntp cookbook
default['ntp']['servers'] = [
    '0.pool.ntp.org',
    '1.pool.ntp.org',
    '2.pool.ntp.org',
    '3.pool.ntp.org'
  ]

# selinux cookbook
default['selinux']['state'] = 'permissive'

# ssh
default['ssh']['allow_users'] = [ 'root' ]
default['ssh']['allow_groups'] = []
default['ssh']['pub_key_users'] = []

# sudoers
default['authorization']['sudo']['users'] = []
default['authorization']['sudo']['passwordless'] = true

# timezone_lwrp cookbook
default['tz'] = 'UTC'


