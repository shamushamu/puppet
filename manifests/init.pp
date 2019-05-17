class profile::ntp(
#versionnumber
$versionnumber = "1",
)
{
	package { 'ntp':
		ensure => installed,
		}
	transition{ 'stop ntp service':    #using Transition module 
		resource => Service['ntp service'],
		attributes =>{ensure => stopped},
		prior_to => File['/etc/puppet.xml']
		}
	file {"/etc/ntp.conf":
        ensure => 'file',
		owner => 'BUILTIN',
		group => 'Administrators',
		source => "/etc/temp/ntp.configfile", #Assume that we have recently updated configfile in this path 
	
	##################ntp.configfile##############################
	####server 127.127.1.0    # local clock                    ###
	####server 0.rhel.pool.ntp.org iburst  # remote clock      ###
    ##############################################################
		}
	file {'/etc/puppet.xml':
		ensure => file,
		content => "Puppet version number ${versionnumber}",
		notify => service['ntp service'],
		}				
	service {'ntp service':
			ensure => running,
			enable => true,
			}
									
}