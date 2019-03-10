# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{title: 'Frontend'}, {title: 'Backend'}, {title: 'Mobile development'}])

Test.create([
              { title: 'Basic Ruby', category: Category.find_by(title: 'Backend') },
              { title: 'Advanced Ruby', level: 1, category: Category.find_by(title: 'Backend') },
              { title: 'Basic Rails', category: Category.find_by(title: 'Frontend') },
              { title: 'Advanced Rails', level: 1, category: Category.find_by(title: 'Frontend') },
              { title: 'Rails Guru', level: 3, category: Category.find_by(title: 'Frontend') },
              { title: 'Basic iOS Development', category: Category.find_by(title: 'Mobile Development') },
              { title: 'Kotlin for Android', level: 2, category: Category.find_by(title: 'Mobile Development') }
            ])

Question.create([
                  { body: 'What is love?', test: Test.find_by(title: 'Basic Ruby') },
                  { body: 'Is it advanced?', test: Test.find_by(title: 'Advanced Ruby') },
                  { body: 'Is it related to railroad?', test: Test.find_by(title: 'Basic Rails') },
                  { body: 'Are you sure its not about railroad?', test: Test.find_by(title: 'Advanced Rails') },
                  { body: 'You really sure its nothing to do with trains?', test: Test.find_by(title: 'Rails Guru') },
                  { body: 'Apple or Android?', test: Test.find_by(title: 'Basic iOS Development') },
                  { body: 'Android or Apple?', test: Test.find_by(title: 'Kotlin for Android') }
                ])

Answer.create([
                { body: 'Chemical Reaction', question: Question.find_by(body: 'What is love?') },
                { body: 'Baby dont hurt me', question: Question.find_by(body: 'What is love?'), correct: true },
                { body: 'No', question: Question.find_by(body: 'Is it advanced?') },
                { body: 'Yes', question: Question.find_by(body: 'Is it advanced?'), correct: true },
                { body: 'No', question: Question.find_by(body: 'Is it related to railroad?'), correct: true },
                { body: 'Yes', question: Question.find_by(body: 'Is it related to railroad?') },
                { body: 'No', question: Question.find_by(body: 'Are you sure its not about railroad?') },
                { body: 'Yes', question: Question.find_by(body: 'Are you sure its not about railroad?'), correct: true },
                { body: 'No', question: Question.find_by(body: 'You really sure its nothing to do with trains?') },
                { body: 'Yes', question: Question.find_by(body: 'You really sure its nothing to do with trains?'), correct: true },
                { body: 'Apple', question: Question.find_by(body: 'Apple or Android?'), correct: true },
                { body: 'Android', question: Question.find_by(body: 'Apple or Android?') },
                { body: 'Apple', question: Question.find_by(body: 'Android or Apple?') },
                { body: 'Android', question: Question.find_by(body: 'Android or Apple?'), correct: true }
              ])

# 0 - user, 1 - teacher, 2 - moderator, 3 - admin, 4 - superadmin, 5 - jesus
User.create(name: 'Hatatych', password: 'verystrongpassword', role: 5)
