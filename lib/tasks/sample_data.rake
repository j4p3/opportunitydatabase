namespace :db do
    desc "Fill Opportunities with sample data"

    task populate: :environment do
        make_users
        make_opportunities
    end

    def make_users
        40.times do |n|
            name = Faker::Name.name
            email = "example-#{n+1}@foo.org"
            url = Faker::Internet.url
            img_url = "http://placekitten.com/g/#{n%200}/#{n%100}"
            user = User.create!(name: name, email: email, url: url, img_url: img_url)
        end
    end

    def make_opportunities
        users = User.all
        users.each do |user|

            position = Faker::Name.title
            company = Faker::Company.name
            contact = Faker::Name.name
            link = Faker::Internet.url
            salary = Faker::Number.number(4)

            case user.id % 4
            when 0
                track = "Dev"
            when 1
                track = "Marketing"
            when 2
                track = "Sales"
            when 3
                track = "Product"
            end

            case user.id % 3
            when 0
                location = "New York City"
            when 1
                location = "Boston"
            when 2
                location = "Chicago"
            end

            user.opportunities.create!(position: position,
                company: company,
                location: location,
                salary: salary,
                contact: contact,
                link: link,
                track: track
            )
        end
    end
end