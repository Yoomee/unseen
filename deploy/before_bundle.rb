gemfile_path = "#{File.dirname(__FILE__)}/../Gemfile"
gem_regex = /gem ['"]([^'"]*)['"],\s*:path\s*=>\s*['"]vendor\/gems['"]/

File.read(gemfile_path).scan(gem_regex).each do |ym_gem|
 run "git clone git://git.yoomee.com:4321/gems/#{ym_gem[0]}.git #{File.dirname(__FILE__)}/../vendor/gems/#{ym_gem[0]}"
end