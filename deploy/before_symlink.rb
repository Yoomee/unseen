FileUtils::mkdir_p "#{shared_path}/dragonfly"
run "ln -s #{shared_path}/dragonfly #{release_path}/data/dragonfly"