server "18.180.67.133", user: "app", roles: %w{app db web}
set :ssh_options, keys: %w(~/.ssh/id_rsa)
