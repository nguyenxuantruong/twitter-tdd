require 'rails_helper'

RSpec.describe User, :type => :model do
	before { @user = create(:user) }

  it "is valid with a email and password" do
  	expect(@user).to be_valid
  end

  # test validations for user model
  it { should have_secure_password }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }
  it "should not be valid with a confirmation mismatch" do
    user = build(:user_mismatch)
    expect(user).not_to be_valid
  end
  it { should have_many(:statuses) }

  describe "when email format is invalid" do
    it "should be invalid" do
      email = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
      email.each do |invalid_email|
        @user.email = invalid_email
        expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
    it "should be valid" do
      email = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      email.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end
  end
end
