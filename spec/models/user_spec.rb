require 'spec_helper'

describe User do

before(:each) do
	@attr = {:first_name => "Example",	:last_name => "user", :email => "user@example.com", :username => "ExUser123", :password => "foobar"}
end

it "should create a new instance given valid atributes" do
	User.create!(@attr)
end

it "should require a first name" do
	no_name_user = User.new(@attr.merge(:first_name => ""))
	no_name_user.should_not be_valid
end


it "should require a last name" do
	no_name_user = User.new(@attr.merge(:last_name => ""))
	no_name_user.should_not be_valid
end

it "should require an email" do
	no_name_user = User.new(@attr.merge(:email => ""))
	no_name_user.should_not be_valid
end

it "should require a username" do
	no_name_user = User.new(@attr.merge(:username => ""))
	no_name_user.should_not be_valid
end

it "should require a password" do
	no_name_user = User.new(@attr.merge(:password => ""))
	no_name_user.should_not be_valid
end

it "should reject first names that are too long" do
long_name = "a" * 51
long_name_user = User.new(@attr.merge(:first_name => long_name))
long_name_user.should_not be_valid
end

it "should reject last names that are too long" do
long_name = "a" * 51
long_name_user = User.new(@attr.merge(:last_name => long_name))
long_name_user.should_not be_valid
end

it "should accept valid email addresses" do
	addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
	addresses.each do |address|
		valid_email_user = User.new(@attr.merge(:email => address))
		valid_email_user.should be_valid
	end
end


it "should reject invalid email addresses" do
	addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
	addresses.each do |address|
		invalid_email_user = User.new(@attr.merge(:email => address))
		invalid_email_user.should_not be_valid
	end
end

it "should reject duplicate email addresses" do
	#put a user with given email address into the database
	User.create!(@attr)
	user_with_duplicate_email = User.new(@attr)
	user_with_duplicate_email.should_not be_valid
end

it "should reject email addresses identical up to case" do
	upcased_email = @attr[:email].upcase
	User.create!(@attr.merge(:email => upcased_email))
	user_with_duplicate_email = User.new(@attr)
	user_with_duplicate_email.should_not be_valid
end



#  pending "add some examples to (or delete) #{__FILE__}"
end
