# -*- encoding : utf-8 -*-
#
  module Ansible
    Version = '0.4.2' unless
      defined?(Version)

    def version
      Ansible::Version
    end

    def dependencies
      {
        'capistrano' => [ 'capistrano'  , ' >= 3.0'   ] ,
        'chef'       => [ 'chef'        , ' >= 11.6.2'   ] ,
      }
    end

    def libdir(*args, &block)
      @libdir ||= File.expand_path(__FILE__).sub(/\.rb$/,'')
      args.empty? ? @libdir : File.join(@libdir, *args)
    ensure
      if block
        begin
          $LOAD_PATH.unshift(@libdir)
          block.call()
        ensure
          $LOAD_PATH.shift()
        end
      end
    end

    def load(*libs)
      libs = libs.join(' ').scan(/[^\s+]+/)
      Ansible.libdir{ libs.each{|lib| Kernel.load(lib) } }
    end

    extend(Ansible)
  end

  begin
    require 'rubygems'
  rescue LoadError
    nil
  end

  if defined?(gem)
    Ansible.dependencies.each do |lib, dependency|
      gem(*dependency)
      require(lib)
    end
  end
