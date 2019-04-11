# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile development' }
                             ])

tests = Test.create([
                      { title: 'Basic Ruby', category: categories[1] },
                      { title: 'Advanced Ruby', level: 1, category: categories[1] },
                      { title: 'Basic Rails', category: categories[0] },
                      { title: 'Advanced Rails', level: 1, category: categories[0] },
                      { title: 'Rails Guru', level: 3, category: categories[0] },
                      { title: 'Basic iOS Development', category: categories[2] },
                      { title: 'Kotlin for Android', level: 2, category: categories[2] }
                    ])

questions = Question.create([
                              { body: 'What is love?', test: tests[0] },
                              { body: 'Is it advanced?', test: tests[1] },
                              { body: 'Is it related to railroad?', test: tests[2] },
                              { body: 'Are you sure its not about railroad?', test: tests[3] },
                              { body: 'You really sure its nothing to do with trains?', test: tests[4] },
                              { body: 'Apple or Android?', test: tests[5] },
                              { body: 'Android or Apple?', test: tests[6] }
                            ])

Answer.create([
                { body: 'Chemical Reaction', question: questions[0] },
                { body: 'Baby dont hurt me', question: questions[0], correct: true },
                { body: 'No', question: questions[1] },
                { body: 'Yes', question: questions[1], correct: true },
                { body: 'No', question: questions[2], correct: true },
                { body: 'Yes', question: questions[2] },
                { body: 'No', question: questions[3] },
                { body: 'Yes', question: questions[3], correct: true },
                { body: 'No', question: questions[4] },
                { body: 'Yes', question: questions[4], correct: true },
                { body: 'Apple', question: questions[5], correct: true },
                { body: 'Android', question: questions[5] },
                { body: 'Apple', question: questions[6] },
                { body: 'Android', question: questions[6], correct: true }
              ])
