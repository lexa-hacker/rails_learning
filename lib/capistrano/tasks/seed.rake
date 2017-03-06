namespace :seed do
  desc "Seed into db"
  task :seed do
    on roles(:app) do
      on host do
        within '/home/deploy/apps/rails_learning/current' do
          execute :rake, 'db:seed RAILS_ENV=production'
        end
      end
    end
  end
end