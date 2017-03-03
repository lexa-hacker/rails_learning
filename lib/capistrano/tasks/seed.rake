namespace :seed do
  desc "Seed into db"
  task :seed do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current" do
        execute :rake, 'db:seed', "RAILS_ENV= #{fetch(:stage)}"
      end
    end
  end
end