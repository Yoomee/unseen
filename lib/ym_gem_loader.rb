if File.dirname(__FILE__) =~ /\/data/
  
  # Engine Yard (deployment) behaviour

  @ym_gems = {}

  def ym_gem(gem_name, checkout = nil)
    gem_name = ymify_gem_name(gem_name)
    if @ym_gems[gem_name] && checkout && @ym_gems[gem_name] != checkout
      raise ArgumentError, "Ambiguous checkouts for #{gem_name}: #{@ym_gems[gem_name]}, #{checkout}", caller
    else
      @ym_gems[gem_name] ||= checkout
    end
  end

  def load_ym_gems!
    ym_gemfiles = Dir["#{release_path}/vendor/gems/*/Gemfile.ym"] + ["#{release_path}/Gemfile.ym"]

    ym_gemfiles.each do |ym_gemfile|
      eval(IO.read(ym_gemfile), binding, ym_gemfile)
    end

    @ym_gems.each do |gem_name, checkout|
      gem_path = "#{release_path}/vendor/gems/#{gem_name}"
      run "git clone -q git://git.yoomee.com:4321/gems/#{gem_name}.git #{gem_path}"
      run "cd #{gem_path};git checkout #{checkout}" if checkout
    end
  end
  
else
  
  # Development behaviour

  def ym_gem(gem_name, checkout = nil)
    return true unless gem_name
    
    gem_name = ymify_gem_name(gem_name)
    gem_path = File.expand_path("../../vendor/gems/#{gem_name}", __FILE__)
    
    if !File.directory?(gem_path)
      system("git clone git://git.yoomee.com:4321/gems/#{gem_name}.git #{gem_path}")
      system("cd #{gem_path};git checkout #{checkout}") if checkout
    end
    
    gem gem_name, :path => File.expand_path("../../vendor/gems", __FILE__)
    
  end

  def load_ym_gems!
    calling_file = caller.detect {|calling_file| calling_file =~ /Gemfile/}.match(/[\/\w]+Gemfile/).to_s
    ym_gemfile = "#{calling_file}.ym"
    eval(IO.read(ym_gemfile), binding, ym_gemfile)
  end

end

def ymify_gem_name(gem_name)
  gem_name =~ /^ym_\w+/ ? gem_name : "ym_#{gem_name}"
end
