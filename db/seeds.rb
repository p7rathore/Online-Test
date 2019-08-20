# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p=Paper.new(name:'Science')

q=p.questions.new(question:'Who is honoured as Father of Modern Chemistry?',q_type:'MCQ',marks:1,duration:120)

q.options.new(option:'Antoine Lavoisier',is_correct:1)
q.options.new(option:'David Joseph',is_correct:0)
q.options.new(option:'Rinky Martin',is_correct:0)
q.options.new(option:'Newton',is_correct:0)

q=p.questions.new(question:'Who invented periodic table?',q_type:'MCQ',marks:1,duration:120)

q.options.new(option:'Dmitri Mendeleev',is_correct:1)
q.options.new(option:'David Joseph',is_correct:0)
q.options.new(option:'Rinky Martin',is_correct:0)
q.options.new(option:'Newton',is_correct:0)

q=p.questions.new(question:"Which is the most abundant gas in the earth's atmosphere?",q_type:'MCQ',marks:1,duration:120)

q.options.new(option:'Nitrogen 78.08%',is_correct:1)
q.options.new(option:'Hydrogen',is_correct:0)
q.options.new(option:'Carbon-di-oxide',is_correct:0)
q.options.new(option:'Helium',is_correct:0)

q=p.questions.new(question:'Which gas evolved from paddy fields and marshes?',q_type:'MCQ',marks:1,duration:120)

q.options.new(option:'Methane',is_correct:1)
q.options.new(option:'Hydrogen',is_correct:0)
q.options.new(option:'Carbon-di-oxide',is_correct:0)
q.options.new(option:'Helium',is_correct:0)

q=p.questions.new(question:'Which toxic element present in automobile exhausts?',q_type:'MCQ',marks:1,duration:120)

q.options.new(option:'Lead',is_correct:1)
q.options.new(option:'Iron',is_correct:0)
q.options.new(option:'copper',is_correct:0)
q.options.new(option:'Tustin',is_correct:0)

q=p.questions.new(question:'Which gases cause acid rain? \"you can select multiple answer\"',q_type:'MAQ',marks:1,duration:120)

q.options.new(option:'Sulphur dioxide',is_correct:1)
q.options.new(option:'Hydrogen',is_correct:0)
q.options.new(option:'Nitrogen oxides',is_correct:1)
q.options.new(option:'Carbon-di-oxide',is_correct:0)

p.save







