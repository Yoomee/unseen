system "cd #{release_path}; bundle"
# gemfile_path = "#{release_path}/Gemfile"
# gem_regex = /gem ['"]([^'"]*)['"],\s*:path\s*=>\s*['"]vendor\/gems['"]/
# 
# File.read(gemfile_path).scan(gem_regex).each do |ym_gem|
#  run "git clone git://git.yoomee.com:4321/gems/#{ym_gem[0]}.git #{release_path}/vendor/gems/#{ym_gem[0]}"
# end