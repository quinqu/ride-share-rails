require "test_helper"

describe WelcomeController do
  it "can go to the welcome page" do
    get welcome_index_path
    
    must_respond_with :success
  end

end
