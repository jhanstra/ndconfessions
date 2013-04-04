FactoryGirl.define do
	factory :user do
		name  "Jared Hanstra"
		email "jhanstra@nd.edu"
		password "foobar"
		password_confirmation "foobar"
	end

	factory :micropost do
    	content "Lorem ipsum"
    end
end