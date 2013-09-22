# libpcap
#
# http://www.tcpdump.org
#
name 'libpcap'
version '1.4.0'
relative_path 'libpcap-1.4.0'
source :url => 'http://www.tcpdump.org/release/libpcap-1.4.0.tar.gz',
       :md5 => '56e88a5aabdd1e04414985ac24f7e76c'

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
