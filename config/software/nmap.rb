# Nmap
#
# http://nmap.org
#
name 'nmap'
version '6.40'
relative_path 'nmap-6.40'
source :url => 'http://nmap.org/dist/nmap-6.40.tar.bz2',
       :md5 => 'c0e2f3370e1fb97fb53185b15aa22aff'

build do
  env = {
          'LDFLAGS' => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
          'CFLAGS' => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
          'LD_RUN_PATH' => "#{install_dir}/embedded/lib"
        }

  command "./configure --prefix=#{install_dir}/embedded", :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
end
