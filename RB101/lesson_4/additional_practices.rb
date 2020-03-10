munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster_hash, details|
  details['age_group'] = case details['age']
  when 0..17
    'kid'
  when 18..64
    'adult'
  else
    'senior'
  end
end

puts munsters