# == Class: udclient
#
# Full description of class udclient here.
#
# === Parameters
#
# udclient
#  [*udclient_zip*]           - udclient zip to be installed
#  [*destination_dir*]        - destination directory where udclient will be installed
#
# === Examples
#
# class { 'udclient::install':
#     udclient_zip		=> 'udclient.zip',
#     destination_dir	=> '/usr/local/udclient'
# }
#
# === Authors
#
# Author Name <Olga.Jdanov@nice.com>
#  

class udclient(
    $udclient_zip		= $udclient::params::udclient_zip,
    $destination_dir	= $udclient::params::destination_dir,
	
    )  inherits udclient::params {
	
		validate_string($udclient_zip)
		validate_string($destination_dir)
		
		# Install zip/unzip
		package { ['zip']:
			ensure		=> present,
			provider	=> 'yum',
		}
		package { ['unzip']:
			ensure		=> present,
			provider	=> 'yum',
		}
		
		file { "$destination_dir/udclient":
			ensure		=> 'directory',
		}

		if ! defined(file["$destination_dir/udclient"]) {
		
			# Copy the udclient zip 
			file { "$destination_dir/$udclient_zip":
				ensure	=> present,
				source	=> "puppet:///modules/udclient/$udclient_zip",
			}
		
			# Extract the Wordpress bundle
			exec { 'extract':
				cwd			=> "$destination_dir",
				path		=> "/usr/bin",
				command		=> "unzip $destination_dir/$udclient_zip; rm -f $destination_dir/$udclient_zip",
				require		=> File["$destination_dir/$udclient_zip"],
			}
		}
		
}
