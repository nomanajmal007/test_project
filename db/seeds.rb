8.times do |business|
    Business.create!(
        name: "Business #{business}",
        description:"We Are opening Soon"
    )
end 

puts "8 Business Created"

8.times do |task|
    Task.create!(
        title: "Task #{task}",
        due_date: DateTime.now,
        task_type: "Not Decided yet",
        image: "http://placehold.it/350x150"

    )
end 

puts "8 Task Created"