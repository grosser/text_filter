#simple method versions for test...
class String
  def strip_tags
    gsub(/<.*?>/,'')
  end

  def simple_format
    "<p>#{self}</p>"
  end

  def truncate(length)
    self[0...length-3]+'...'
  end

  def replace_by_char(char)
    char*length
  end
end

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
  text_filter :summary, :with => [{:truncate=>10, :replace_by_char=>'x'}, :simple_format]
end