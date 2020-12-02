set :application, 'survey'
set :repo_url, 'git@github.com:sleepinglion/survey.git'
set :branch, 'master'
set :deploy_to, '/home/deploy/survey'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
set :pty, true
set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/assets public/ckeditor public/uploads}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'tmp:clear'
      end
    end
  end

  desc 'Refresh sitemap'
  task :refresh_sitemap do
    on roles(:app), in: :sequence, wait: 1 do
      within release_path do
        with rails_env: (fetch(:rails_env) || fetch(:stage)) do
          execute :rake, 'sitemap:refresh'
        end
      end
    end
  end

  #  after :finishing, 'deploy:refresh_sitemap'
  after :finishing, 'deploy:cleanup'
end
