node 'cports.localhost' {
        file { "/etc/profile.d/proxy.sh": ensure => present, }

        line { http_proxy:
                file => "/etc/profile.d/proxy.sh",
                line => "export http_proxy=http://proxy.tchpc.tcd.ie:8080",
                require => File["/etc/profile.d/proxy.sh"],
        }

        line { https_proxy:
                file => "/etc/profile.d/proxy.sh",
                line => "export https_proxy=http://proxy.tchpc.tcd.ie:8080",
                require => File["/etc/profile.d/proxy.sh"],
        }

        line { ftp_proxy:
                file => "/etc/profile.d/proxy.sh",
                line => "export ftp_proxy=http://proxy.tchpc.tcd.ie:8080",
                require => File["/etc/profile.d/proxy.sh"],
        }


        Package { ensure => "installed" }
        $enhancers = [ "screen", "strace", "sudo", "git", "gcc-gfortran" ]
        package { $enhancers: 
                require => Line["http_proxy", "https_proxy", "ftp_proxy"],
        }
}
