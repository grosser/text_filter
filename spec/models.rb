ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :name
  end

  create_table :products do |t|
    t.string :title, :description
  end
end

#create model
class User < ActiveRecord::Base
  text_filter :name, :with => :strip_tags
end

class Product < ActiveRecord::Base
  text_filter :title, :description, :with => :strip_tags
  text_filter :title, :with => [{:truncate=>10}, :simple_format]
end