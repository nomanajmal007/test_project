
8.times do |task|
    Task.create!(
        title: "Task #{task}",
        due_date: DateTime.now,
        task_type: "Not Decided yet",
        image: "http://placehold.it/350x150",
        business_id: 1
        
    )
end 

puts "8 Task Created"