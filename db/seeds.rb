Candidate.delete_all
100.times do |i|
    Candidate.create(name: "Candidate #{i+1}", phone_number: 989, email: "cand#{i+1}@mail.com", address: "Cand#{i+1}")
end