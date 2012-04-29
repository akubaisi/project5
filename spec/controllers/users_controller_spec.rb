require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
	
	it "should have the right title" do
		get 'new'
		response.should have_selector("title", :content => "Sign up")
	end
	
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
  
	before(:eahc) do
		@user = Factory(:user)
	end
    
	it "returns http success" do
      get 'show'
      response.should be_success
    end
	
	it "should find the right user" do
		get 'show'
		assign(:user).should == @user
	end
  
#	it "should have a profile image" do
#		get :show
#		response.should have_selector("h1>img", :class => "gravatar")
#	end
  
  
  
  end

end
