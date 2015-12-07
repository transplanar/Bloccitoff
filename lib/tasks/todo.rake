namespace :todo do
  desc "Delete items older than seven days"

  task delete_items: :environment do
    #REVIEW why does this need both <7 and -7 parameters here?
    #REVIEW Explain this syntax
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
