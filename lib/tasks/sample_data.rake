namespace :db do
    desc "Fill Opportunities with sample data"
    task populate: :environment do
        20.times do |n|
            position = Faker::Name.title
            company = Faker::Company.name
            contact = Faker::Name.name
            link = Faker::Internet.url
            salary = Faker::Number.number(5)

            case n % 4
            when 0
                track = "dev"
            when 1
                track = "marketing"
            when 2
                track = "sales"
            when 3
                track = "product"
            end

            case n % 3
            when 0
                location = "nyc"
            when 1
                location = "bos"
            when 2
                location = "chi"
            end

            Opportunity.create!(position: position,
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