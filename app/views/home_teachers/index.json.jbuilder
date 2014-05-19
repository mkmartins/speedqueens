json.array!(@home_teachers) do |home_teacher|
  json.extract! home_teacher, :id, :name
  json.url home_teacher_url(home_teacher, format: :json)
end
