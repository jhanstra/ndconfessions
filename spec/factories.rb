FactoryGirl.define do
	factory :user do
		name  "Jared Hanstra"
		email "jhanstra@nd.edu"
		password "foobar"
		password_confirmation "foobar"
	end
end