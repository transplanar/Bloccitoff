namespace :todo do
  desc "Delete items older than seven days"

  task delete_items: :environment do
    #REVIEW 2- Explain this syntax
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
