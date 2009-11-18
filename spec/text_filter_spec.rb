require 'spec/spec_helper'

describe String do
  it "can strip tags" do
    "<a>xx</a>".strip_tags.should == 'xx'
  end
end

describe TextFilter do
  before do
    @user = User.new
    @product = Product.new
  end

  it "is called on assign" do
    @user.name = '<a>xx</a>'
    @user.name.should == 'xx'
  end

  it "does nothing with blank" do
    @user.name = ''
    @user.name.should == ''
  end

  it "does nothing with nil" do
    @user.name = nil
    @user.name.should == nil
  end

  it "does nothing with numbers" do
    @user.name = 123
    @user.name.should == 123
  end

  it "works with multiple fields" do
    @product.description = '<a>xx</a>'
    @product.description.should == 'xx'
  end

  it "works with nested options" do
    @product.title = '12345678901234567890'
    @product.title.should == '<p>1234567...</p>'
  end

  it "works with multiple nested options" do
    @product.summary = '12345678901234567890'
    @product.summary.should == '<p>xxxxxxx...</p>'
  end

  #this behavior cannot be overwritten, but just to be on the safe side...
  it "returns the assigned value" do
    result = (@product.summary = 'abcd')
    result.should == 'abcd'
  end
end