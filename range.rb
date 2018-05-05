# Ranges in case Statements
score = 70

result = case score
    when 0..40
         "fail"
    when 41..60
        "pass"
    else 
        "invalid"
end

puts result
