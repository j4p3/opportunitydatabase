require 'csv'

desc "Import Opportunities from csv file"
task import: [:environment] do
    # Why is it so hard to get a rake task to take a variable? Help me.

    file = "db/gdoc_design.csv"
    CSV.foreach(file, headers: true) do |row|
        row[0] ? company = row[0] : company = 'null'
        row[1] ? position = row[1] : position = 'null'
        row[2] ? link = row[2] : link = 'null'
        row[3] ? location = row[3] : location = 'null'
        row[4] ? salary = row[4] : salary = 0

        Opportunity.create!({
            company: company,
            position: position,
            link: link,
            location: location,
            salary: salary,
            contact: row[6],
            user_id: 1,
            track: 'product'
        })
    end

    file = "db/gdoc_dev.csv"
    CSV.foreach(file, headers: true) do |row|
        row[0] ? company = row[0] : company = 'null'
        row[1] ? position = row[1] : position = 'null'
        row[2] ? link = row[2] : link = 'null'
        row[3] ? location = row[3] : location = 'null'
        row[4] ? salary = row[4] : salary = 0

        Opportunity.create!({
            company: company,
            position: position,
            link: link,
            location: location,
            salary: salary,
            contact: row[6],
            user_id: 1,
            track: 'dev'
        })
    end

    file = "db/gdoc_sales.csv"
    CSV.foreach(file, headers: true) do |row|
        row[0] ? company = row[0] : company = 'null'
        row[1] ? position = row[1] : position = 'null'
        row[2] ? link = row[2] : link = 'null'
        row[3] ? location = row[3] : location = 'null'
        row[4] ? salary = row[4] : salary = 0

        Opportunity.create!({
            company: company,
            position: position,
            link: link,
            location: location,
            salary: salary,
            contact: row[6],
            user_id: 1,
            track: 'sales'
        })
    end

    file = "db/gdoc_marketing.csv"
    CSV.foreach(file, headers: true) do |row|
        row[0] ? company = row[0] : company = 'null'
        row[1] ? position = row[1] : position = 'null'
        row[2] ? link = row[2] : link = 'null'
        row[3] ? location = row[3] : location = 'null'
        row[4] ? salary = row[4] : salary = 0

        Opportunity.create!({
            company: company,
            position: position,
            link: link,
            location: location,
            salary: salary,
            contact: row[6],
            user_id: 1,
            track: 'marketing'
        })
    end
end