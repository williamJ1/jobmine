# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#teen user
Contract.destroy_all
Job.destroy_all
Profile.destroy_all
User.destroy_all
Review.destroy_all

teen_user = User.create(email: 'teen@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile = Profile.create(address: 'teen addr', phone_num: 123456789,
                            gender: 'male', user_id: teen_user.id, user_type: 'teen')

teen_user_1 = User.create(email: 'teen1@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_1 = Profile.create(address: 'teen1 addr', phone_num: 123456789,
                            gender: 'male', user_id: teen_user_1.id, user_type: 'teen')

teen_user_2 = User.create(email: 'teen2@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_2 = Profile.create(address: 'teen2 addr', phone_num: 123456789,
                            gender: 'male', user_id: teen_user_2.id, user_type: 'teen')


#employer user
emp_user = User.create(email: 'emp@e.com', password: '1234', password_confirmation: '1234')
#employer profile
emp_profile = Profile.create(address: 'emp addr', phone_num: 123456789,
                            gender: 'male', user_id: emp_user.id, user_type: 'employer')

emp_user_1 = User.create(email: 'emp1@e.com', password: '1234', password_confirmation: '1234')
#employer profile
emp_profile_1 = Profile.create(address: 'emp1 addr', phone_num: 123456789,
                            gender: 'male', user_id: emp_user_1.id, user_type: 'employer')


start = DateTime.new(2017,11,1,0,0,0)
end_time = DateTime.new(2017,12,3,0,0,0)

#jobs

job1 = Job.create(name: 'job1', description: 'job1', begin_date_time: start, end_date_time: end_time,
				  				location: 'job1 location', hour_rate: 10, profile_id: emp_profile.id)
job2 = Job.create(name: 'job2', description: 'job2', begin_date_time: start, end_date_time: end_time,
                  location: 'job2 location', hour_rate: 20, profile_id: emp_profile.id)
job3 = Job.create(name: 'job3', description: 'job3', begin_date_time: start, end_date_time: end_time,
                  location: 'job3 location', hour_rate: 30, profile_id: emp_profile.id)

job4 = Job.create(name: 'job4', description: 'job4', begin_date_time: start, end_date_time: end_time,
				  				location: 'job4 location', hour_rate: 10, profile_id: emp_profile_1.id)
job5 = Job.create(name: 'job5', description: 'job5', begin_date_time: start, end_date_time: end_time,
                  location: 'job5 location', hour_rate: 20, profile_id: emp_profile_1.id)
job6 = Job.create(name: 'job6', description: 'job6', begin_date_time: start, end_date_time: end_time,
                  location: 'job6 location', hour_rate: 30, profile_id: emp_profile_1.id)
#contracts
contract1 = Contract.create(accept_status: 0, profile_id: teen_profile.id, job_id: job1.id)
contract2 = Contract.create(accept_status: 2, profile_id: teen_profile.id, job_id: job2.id)
contract3 = Contract.create(accept_status: 0, profile_id: teen_profile_1.id, job_id: job1.id)
contract4 = Contract.create(accept_status: 0, profile_id: teen_profile_2.id, job_id: job1.id)

#timeslot
timeslot1 = Timeslot.create(date_time_begin: start, time_length: 2, approve_status: 0, paid_time: 0, contract_id: contract2.id)
timeslot2 = Timeslot.create(date_time_begin: start, time_length: 1, approve_status: 1, paid_time: 0, contract_id: contract2.id)
timeslot3 = Timeslot.create(date_time_begin: start, time_length: 3, approve_status: 2, paid_time: 0, contract_id: contract2.id)



#reviews
review1 = Review.create(rating: 4, body: 'review1', profile_id: teen_profile.id, reviewer: 'emp@e.com', contract_id: contract1.id)
review2 = Review.create(rating: 4.5, body: 'review2', profile_id: teen_profile_1.id, reviewer: 'emp@e.com', contract_id: contract2.id)
review3 = Review.create(rating: 3.5, body: 'review3', profile_id: teen_profile_2.id, reviewer: 'emp@e.com', contract_id: contract1.id)
review4 = Review.create(rating: 5, body: 'review4', profile_id: emp_profile.id, reviewer: 'teen@t.com', contract_id: contract3.id)
review5 = Review.create(rating: 3, body: 'review5', profile_id: emp_profile.id, reviewer: 'teen@t.com', contract_id: contract3.id)
review6 = Review.create(rating: 2.5, body: 'review6', profile_id: emp_profile_1.id, reviewer: 'teen2@t.com', contract_id: contract4.id)
review7 = Review.create(rating: 2, body: 'review7', profile_id: teen_profile_1.id, reviewer: 'emp1@e.com', contract_id: contract2.id)
review8 = Review.create(rating: 1.5, body: 'review8', profile_id: teen_profile_2.id, reviewer: 'emp1@e.com', contract_id: contract4.id)
review9 = Review.create(rating: 1, body: 'review9', profile_id: emp_profile.id, reviewer: 'teen@t.com', contract_id: contract3.id)
review10 = Review.create(rating: 4.5, body: 'review10', profile_id: emp_profile.id, reviewer: 'teen@t.com', contract_id: contract3.id)

