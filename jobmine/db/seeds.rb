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
Review.destroy_all
Profile.destroy_all
User.destroy_all
Timeslot.destroy_all


######login for teenager: teen_user
######login for employer: emp_user_1

#seed 8 teenager
teen_user = User.create(email: 'Stephen_Smith@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile = Profile.create(address: '500 Kingston Rd Toronto ON M4L 1V3(Toronto ,Ontario)', phone_num: 4166948464,
                            gender: 'male', user_id: teen_user.id, user_type: 'teen')

teen_user_1 = User.create(email: 'John_Smith@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_1 = Profile.create(address: '315 St Germain Ave Toronto ON M5M 1W4(Toronto ,Ontario)', phone_num: 4163227518,
                            gender: 'male', user_id: teen_user_1.id, user_type: 'teen')

teen_user_2 = User.create(email: 'Lila_Jenkins@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_2 = Profile.create(address: '234 Willow Ave Toronto ON M4E 3K7(Toronto ,Ontario)', phone_num: 4166998444,
                            gender: 'female', user_id: teen_user_2.id, user_type: 'teen')

teen_user_3 = User.create(email: 'Nellie_Ryan@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_3 = Profile.create(address: '26 Goodwood Park Cres East York ON M4C 2G5(Toronto ,Ontario)' , phone_num: 4166998071,
																gender: 'female', user_id: teen_user_3.id, user_type: 'teen')

teen_user_4 = User.create(email: 'James_Smith@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_4 = Profile.create(address: '48 St Clair Ave W Toronto ON M4V 2Z2(Toronto ,Ontario)', phone_num: 4163040129,
																gender: 'male', user_id: teen_user_4.id, user_type: 'teen')

teen_user_5 = User.create(email: 'Donald_Smith@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_5 = Profile.create(address: '48 Norwood Rd Toronto ON M4E 2S2(Toronto ,Ontario)', phone_num: 4166981502,
																gender: 'male', user_id: teen_user_5.id, user_type: 'teen')

teen_user_6 = User.create(email: 'Kate_Hughes@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_6 = Profile.create(address: '717 Broadview Ave Toronto ON M4K 2P5(Toronto ,Ontario)', phone_num: 4166980092,
																gender: 'female', user_id: teen_user_6.id, user_type: 'teen')

teen_user_7 = User.create(email: 'Lucy_Grant@t.com', password: '123', password_confirmation: '123')
#teen profile
teen_profile_7 = Profile.create(address: '65 Harbour Sq Toronto ON M5J 2L4(Toronto ,Ontario)', phone_num: 4168636627,
																gender: 'female', user_id: teen_user_7.id, user_type: 'teen')



#seed 8 employer

emp_user = User.create(email: 'Paula_Gardner_0_1@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile = Profile.create(address: '17 Whitaker Ave Toronto ON M6J 1A2(Toronto ,Ontario)	', phone_num: 4163634231,
															 gender: 'male', user_id: emp_user.id, user_type: 'employer')

emp_user_0 = User.create(email: 'Paula_Gardner@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_0 = Profile.create(address: '17 Whitaker Ave Toronto ON M6J 1A2(Toronto ,Ontario)	', phone_num: 4163634231,
                               gender: 'male', user_id: emp_user_0.id, user_type: 'employer')

emp_user_1 = User.create(email: 'Roberto_Murphy@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_1 = Profile.create(address: '127 Scarborough Rd Toronto ON M4E 3M4(Toronto ,Ontario)', phone_num: 4166949887,
                            gender: 'male', user_id: emp_user_1.id, user_type: 'employer')

emp_user_2 = User.create(email: 'Theodore_Green@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_2 = Profile.create(address: '65 Harbour Sq Toronto ON M5J 2L4(Toronto ,Ontario)', phone_num: 4168636627,
															 gender: 'male', user_id: emp_user_2.id, user_type: 'employer')

emp_user_3 = User.create(email: 'Yvonne_Boone@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_3 = Profile.create(address: '1210 Don Mills Rd North York ON M3B 3N9(Toronto ,Ontario)', phone_num: 4166965339,
															 gender: 'female', user_id: emp_user_3.id, user_type: 'employer')

emp_user_4 = User.create(email: 'Janie_Mccoy@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_4 = Profile.create(address: '796 Bloor St W, Toronto, ON M6G 1L7', phone_num: 4166980092,
															 gender: 'female', user_id: emp_user_4.id, user_type: 'employer')

emp_user_5 = User.create(email: 'Clay_Foster@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_5 = Profile.create(address: '48 Norwood Rd Toronto ON M4E 2S2(Toronto ,Ontario)', phone_num: 4166981502,
															 gender: 'female', user_id: emp_user_5.id, user_type: 'employer')

emp_user_6 = User.create(email: 'Freda_Fitzgerald@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_6 = Profile.create(address: '300 Silver Birch Ave Toronto ON M4E 3L5(Toronto ,Ontario)', phone_num: 4166980386,
															 gender: 'male', user_id: emp_user_6.id, user_type: 'employer')

emp_user_7 = User.create(email: 'Howard_Chavez@e.com', password: '123', password_confirmation: '123')
#employer profile
emp_profile_7 = Profile.create(address: '8 Oliver Mews Toronto ON M4L 3E4(Toronto ,Ontario)', phone_num: 4166982765,
															 gender: 'male', user_id: emp_user_7.id, user_type: 'employer')



start = DateTime.new(2017,11,1,0,0,0)
end_time = DateTime.new(2017,12,3,0,0,0)

start_1 = DateTime.new(2017,11,1,0,0,0)
end_time_1 = DateTime.new(2017,12,3,0,0,0)

start_2 = DateTime.new(2017,7,3,0,0,0)
end_time_2 = DateTime.new(2017,12,3,0,0,0)

start_3 = DateTime.new(2017,12,3,0,0,0)
end_time_3 = DateTime.new(2018,9,29,0,0,0)

start_4 = DateTime.new(2018,3,3,0,0,0)
end_time_4 = DateTime.new(2018,10,1,0,0,0)

start_5 = DateTime.new(2018,2,10,0,0, 0)
end_time_5 = DateTime.new(2019,2,10,0,0,0)



#jobs

job1 = Job.create(name: 'babysitting', description: 'Somebody full of energy to take care of my energetic son. Take care for 7 months old baby, to play with him, feed him and entertain him while parents are busy', begin_date_time: start_1, end_date_time: end_time_1,
				  				location: '110 charles street east Toronto Canada', hour_rate: 15, profile_id: emp_profile_1.id)

job2 = Job.create(name: 'PART TIME OUTSIDE CLEANER', description: 'Looking for a part time outdoor cleaner for night work. Must be able to drive & get to our yard in Bradford. Wage (cash) depends on experience. Send a resume with first email', begin_date_time: start_2, end_date_time: end_time_2,
                  location: '93 Front St E, Toronto, ON M5E 1C3', hour_rate: 20, profile_id: emp_profile_1.id)

job3 = Job.create(name: 'Looking for Breakfast Line Cooks ASAP - PT Positions!', description: 'Good Compensation! Looking to hire full time and part time line cooks ASAP At Lake Shore just west of Park Lawn. Hours of operation are from 630 am to 430 pm. Strong candidates possess previous experience and can work as a team. Positions available asap. Breakfast experience is an asset. Please forward your resume to eparaskakis@hotmail.com or
ep.panagiosmimico@hotmail.com Or call (416) 579-6333 ', begin_date_time: start_3, end_date_time: end_time_3,
                  location: '2324 Lake Shore Blvd W, Etobicoke, ON M8V 1B6, Canada', hour_rate: 30, profile_id: emp_profile_1.id)

job4 = Job.create(name: 'Landscaping/Snow Plowing Manager Required', description: 'Position available immediately, experience required, Driver license required', begin_date_time: start_4, end_date_time: end_time_4,
				  				location: '1 Austin Terrace, Toronto, ON M5R 1X8', hour_rate: 25, profile_id: emp_profile_1.id)

job5 = Job.create(name: 'Snow Removal Now Hiring - Highest Industry Pay Rate - Call Now', description: 'Triple J Contracting is looking to hire the following positions:

AZ/DZ Dump Truck Drivers
Pick-Up Truck, Plow Truck and Salt Truck Drivers
Machine Operators for Snow Plowing with Loaders and Tractors
Sidewalk Crew: Using Shovels, Sidewalk Tractors and Blowers

Paying highest industry rates for qualified people!

Please call Dave if interested

(416) 479-9722x601', begin_date_time: start_5, end_date_time: end_time_5,
                  location: '8964 York Regional Rd 27, Woodbridge, ON L4L 1A7, Canada', hour_rate: 20, profile_id: emp_profile_1.id)

job6 = Job.create(name: 'Wanted: Dog sitter', description: 'We are looking for a reliable person to spend time walking and playing with our small dog from Monday to Friday around 7-9pm for 1hr. must live in elmwood.
100$/week. Call or text 5193795300.', begin_date_time: start_1, end_date_time: end_time_1,
                  location: '150 Kilgour Rd, East York, ON M4G 1R8', hour_rate: 15, profile_id: emp_profile_1.id)

job7 = Job.create(name: 'Dog Boarding in Burlington', description: 'We are a family who love dogs. We have our own Boxer named Shadow. We have a fenced in backyard for them to play in as well as a nice walking trail for long walks. We have crates for dogs who need them and a sectioned off area for those that dont. Any questions please feel free to ask. If in the Western GTA we can provide pick up and drop off service', begin_date_time: start_2, end_date_time: end_time_2,
									location: 'Burlington, ON L7N3C7', hour_rate: 15, profile_id: emp_profile_1.id)

job8 = Job.create(name: 'Wanted: Privet tutoring', description: 'I am looking in home tutor in math and English for 13 old my phone 6472446596', begin_date_time: start_2, end_date_time: end_time_2,
									location: '2005 Avenue Rd, North York, ON M5M 4A5', hour_rate: 25, profile_id: emp_profile_1.id)

job9 = Job.create(name: 'House Cleaner at reasonable price', description: 'Looking for cleaning person for weekly, monthly, move in/out or just one time cleans for holidays contact Amy at 289 927 1276 or at amyshy2010@gmail.com', begin_date_time: start_1, end_date_time: end_time_1,
									location: '819 Bathurst St, Toronto, ON M5R 3G2', hour_rate: 20, profile_id: emp_profile_1.id)

job10 = Job.create(name: 'Seeking Clients for Early Morning Dog Walking!', description: 'Looking for reliable dog walker to walk my dog, pelase contact', begin_date_time: start_3, end_date_time: end_time_3,
									location: '67 Roncesvalles Ave, Toronto, ON M6R 2K6', hour_rate: 25, profile_id: emp_profile_1.id)


#contracts
#contract for teen_profile, all jobs posted by emp_profile_0
contract1 = Contract.create(accept_status: 0, profile_id: teen_profile.id, job_id: job1.id)
contract2 = Contract.create(accept_status: 2, profile_id: teen_profile.id, job_id: job4.id)
contract3 = Contract.create(accept_status: 1, profile_id: teen_profile.id, job_id: job5.id)
contract4 = Contract.create(accept_status: 1, profile_id: teen_profile.id, job_id: job6.id)
contract5 = Contract.create(accept_status: 2, profile_id: teen_profile.id, job_id: job5.id)
contract6 = Contract.create(accept_status: 2, profile_id: teen_profile.id, job_id: job6.id)
contract7 = Contract.create(accept_status: 3, profile_id: teen_profile.id, job_id: job9.id)
contract8 = Contract.create(accept_status: 3, profile_id: teen_profile.id, job_id: job10.id)

#add contract for jobs posted by emp_profile_0 at pending states
contract9 = Contract.create(accept_status: 0, profile_id: teen_profile_1.id, job_id: job1.id)
contract10 = Contract.create(accept_status: 0, profile_id: teen_profile_2.id, job_id: job2.id)
contract11 = Contract.create(accept_status: 0, profile_id: teen_profile_3.id, job_id: job3.id)
contract12 = Contract.create(accept_status: 0, profile_id: teen_profile_4.id, job_id: job1.id)
contract13 = Contract.create(accept_status: 0, profile_id: teen_profile_5.id, job_id: job2.id)
contract14 = Contract.create(accept_status: 0, profile_id: teen_profile_6.id, job_id: job3.id)


paid_time0 = DateTime.new(2016,7,1,0,0,0)
paid_time1 = DateTime.new(2016,8,3,2,0,0)
paid_time2 = DateTime.new(2017,2,11,0,0,0)
paid_time3 = DateTime.new(2017,3,11,0,0,0)
paid_time4 = DateTime.new(2017,10,5,0,0,0)


work_time_1 = DateTime.new(2016,10,1,0,0,0)
work_time_2 = DateTime.new(2017,6,1,0,0,0)
work_time_3 = DateTime.new(2017,7,2,0,0,0)
work_time_4 = DateTime.new(2017,9,2,0,0,0)
work_time_5 = DateTime.new(2017,10,1,0,0,0)


#only seed for the first ongoing job, contract2 -> job4
timeslot1 = Timeslot.create(date_time_begin: work_time_1, time_length: 2, approve_status: 0, paid_time: paid_time0, contract_id: contract2.id)
timeslot2 = Timeslot.create(date_time_begin: work_time_2, time_length: 1, approve_status: 0, paid_time: paid_time1, contract_id: contract2.id)
timeslot3 = Timeslot.create(date_time_begin: work_time_3, time_length: 3, approve_status: 0, paid_time: paid_time2, contract_id: contract2.id)
timeslot4 = Timeslot.create(date_time_begin: work_time_4, time_length: 2, approve_status: 1, paid_time: paid_time3, contract_id: contract2.id)
timeslot4 = Timeslot.create(date_time_begin: work_time_5, time_length: 5, approve_status: 2, paid_time: paid_time4, contract_id: contract2.id)


#reviews
review1 = Review.create(rating: 4, title:'Good', body: 'Good proformance!', profile_id: teen_profile.id, reviewer: 'Roberto_Murphy@e.com',reviewer_id: emp_profile_1.id, contract_id: contract7.id)
review2 = Review.create(rating: 4.5, title:'Excellent', body: 'Excellent work!!', profile_id: teen_profile.id, reviewer: 'Roberto_Murphy@e.com',reviewer_id: emp_profile_1.id, contract_id: contract7.id)
review3 = Review.create(rating: 3.5, title:'Good', body: 'Good proformance!', profile_id: teen_profile.id, reviewer: 'Roberto_Murphy@e.com',reviewer_id: emp_profile_1.id, contract_id: contract8.id)
review4 = Review.create(rating: 1, title:'Bad', body: 'Bad work -_-', profile_id: teen_profile.id, reviewer: 'Roberto_Murphy@e.com',reviewer_id: emp_profile_1.id, contract_id: contract7.id)
review5 = Review.create(rating: 5, title:'Excellent', body: 'Excellent work!!', profile_id: teen_profile.id, reviewer: 'Roberto_Murphy@e.com',reviewer_id: emp_profile_1.id, contract_id: contract8.id)
review6 = Review.create(rating: 3.5, title:'Good', body: 'Good proformance!', profile_id: emp_profile_1.id, reviewer: 'Stephen_Smith@t.com',reviewer_id: teen_profile.id, contract_id: contract7.id)
review7 = Review.create(rating: 4, title:'Good', body: 'Good proformance!', profile_id: emp_profile_1.id, reviewer: 'Stephen_Smith@t.com',reviewer_id: teen_profile.id, contract_id: contract8.id)
review8 = Review.create(rating: 3.5, title:'Good', body: 'Good proformance!', profile_id: emp_profile_1.id, reviewer: 'Stephen_Smith@t.com',reviewer_id: teen_profile.id, contract_id: contract8.id)
review9 = Review.create(rating: 1.5, title:'Bad', body: 'Bad work -_-', profile_id: emp_profile_1.id, reviewer: 'Stephen_Smith@t.com',reviewer_id: teen_profile.id, contract_id: contract8.id)
review10 = Review.create(rating: 4.5, title:'Excellent', body: 'Excellent work!!', profile_id: emp_profile_1.id, reviewer: 'Stephen_Smith@t.com',reviewer_id: teen_profile.id, contract_id: contract7.id)


