include stdlib

$jenkins_config = {
  'JENKINS_JAVA_OPTIONS' => { 'value' => '-Djava.awt.headless=true -XX:MaxPermSize=512m' },
}

class { '::firewall':
  ensure => stopped,
}

class { '::java':
  #package => 'java-1.8.0-openjdk',
} ->
class { '::jenkins':
  repo               => false,
  executors          => 2,
	config_hash        => $jenkins_config,
  configure_firewall => true,
  install_java       => false,
}
yumrepo {'jenkins':
  descr    => 'Jenkins',
  baseurl  => 'http://pkg.jenkins-ci.org/redhat/',
  gpgcheck => 1,
  gpgkey   => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
  enabled  => 1,
}


if !defined(Package['openssl-devel']) {
  package { 'openssl-devel': }
}
if !defined(Package['readline-devel']) {
  package { 'readline-devel': }
}
if !defined(Package['zlib-devel']) {
  package { 'zlib-devel': }
}
jenkins::plugin { [
  'ansicolor',

  'credentials',
  'credentials-binding',
  'plain-credentials',
  'workflow-step-api',

  'job-dsl',

  'copy-project-link',

  'rbenv',
  'ruby-runtime',

  'ssh-agent',

  'git',
  'git-client',
  'scm-api',
  'mailer',
  'token-macro',
  'matrix-project',
  'ssh-credentials',

  'parameterized-trigger',
  'subversion',
  'promoted-builds',
  'conditional-buildstep',

  'build-flow-plugin',
  'buildgraph-view',

  'groovy-postbuild',
  'script-security',

  'multiple-scms',
  'ws-cleanup',

  'gradle',
  'envinject',

  'global-build-stats',

  'rebuild'
]: }
