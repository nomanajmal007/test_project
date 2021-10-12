8.times do |business|
    Business.create!(
        name: "Business #{business}",
        description:"We Are opening Soon"
    )
end 

puts "8 Business Created"