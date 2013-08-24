require 'csv'

desc "Import Opportunities from csv file"
task import: [:environment] do
    # Why is it so hard to get a rake task to take a variable? Help me.

    opportunity_files = {
        "product"   => "db/gdoc_design.csv",
        "dev"       => "db/gdoc_dev.csv",
        "sales"     => "db/gdoc_sales.csv",
        "marketing" => "db/gdoc_marketing.csv"
    }

    def format_salary(string)
        # this crazy regex is super fragile, but is meant to deal with legacy csv data and also deal with salary ranges -_-
        array = string.gsub(/\s*\$*k*,*/,'').split('-')
        return array = [0,0] if array.empty? # this handles cases of '', ' - ', etc.
        array.map do |sal|
            (sal.to_i % 1000 > 1) ? sal.to_i : sal.to_i * 1000
        end
        array[1] = array[0] if array[1].nil?
        array
    end

    def create_opportunities(file, track)
        count = 0
        CSV.foreach(file, headers: true) do |row|
            company  = row[0].present? ? row[0] : 'null'
            position = row[1].present? ? row[1] : 'null'
            link     = row[2].present? ? row[2] : 'null'
            location = row[3].present? ? row[3] : 'null'
            salary   = row[4].present? ? format_salary(row[4]) : 0

            Opportunity.create!({
                company: company,
                position: position,
                link: link,
                location: location,
                salary_low: salary[0],
                salary_high: salary[1],
                contact: row[6],
                user_id: 1,
                track: track
            })
            count += 1
        end
        puts "imported #{count} records from #{file}"
    end    

    opportunity_files.each do |track, file|
        create_opportunities(file, track)
    end
end