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

teen_user = User.create(email: 'teen@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile = Profile.create(address: 'teen addr', phone_num: 123456789,
                            gender: 'male', user_id: teen_user.id, user_type: 'teen')

#employer user
emp_user = User.create(email: 'emp@e.com', password: '1234', password_confirmation: '1234')
#employer profile
emp_profile = Profile.create(address: 'emp addr', phone_num: 123456789,
                            gender: 'male', user_id: emp_user.id, user_type: 'employer')



start = DateTime.new(2017,11,1,0,0,0)
end_time = DateTime.new(2017,12,3,0,0,0)

#jobs

job1 = Job.create(name: 'job1', description: 'job1', begin_date_time: start, end_date_time: end_time,
location: 'job1 location', hour_rate: 10, profile_id: emp_profile.id)
job2 = Job.create(name: 'job2', description: 'job2', begin_date_time: start, end_date_time: end_time,
                  location: 'job2 location', hour_rate: 20, profile_id: emp_profile.id)
job3 = Job.create(name: 'job3', description: 'job3', begin_date_time: start, end_date_time: end_time,
                  location: 'job3 location', hour_rate: 30, profile_id: emp_profile.id)

#contracts
contract1 = Contract.create(accept_status: 0, profile_id: teen_profile.id, job_id: job1.id)
contract2 = Contract.create(accept_status: 2, profile_id: teen_profile.id, job_id: job2.id)

#timeslot
timeslot1 = Timeslot.create(date_time_begin: start, time_length: 2, is_approved: false, is_paid: false, contract_id: contract2.id)
timeslot2 = Timeslot.create(date_time_begin: start, time_length: 1, is_approved: true, is_paid: false, contract_id: contract2.id)



