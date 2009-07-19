require 'spec/spec_helper'

describe String do
  it "can strip tags" do
    "<a>xx</a>".strip_tags.should == 'xx'
  end
end

describe TextFilter do
  before do
    @user = User.new
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
end