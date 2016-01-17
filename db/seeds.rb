# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

doctors_categories = [
    {name: 'Gastro'},
    {name: 'Cardiology'},
    {name: 'Psychiatry'},
    {name: 'Paediatrics'},
    {name: 'Respiratory'},
    {name: 'Neurology'},
    {name: 'Genitourinary'},
    {name: 'Dermatology'}
]

doctors_categories.each {|category| DoctorsCategory.find_or_create_by(category)}

doctors_category_id = DoctorsCategory.find_by_name('Cardiology').try(:id)
diseases_categories = [
    {name: 'Intermittent pulse', doctors_category_id: doctors_category_id},
    {name: 'Rapid pulse', doctors_category_id: doctors_category_id},
    {name: 'Sweating', doctors_category_id: doctors_category_id},
    {name: 'Weakness', doctors_category_id: doctors_category_id},
    {name: 'Giddiness', doctors_category_id: doctors_category_id},
    {name: 'Chest Pain', doctors_category_id: doctors_category_id},
    {name: 'Swelling of the body', doctors_category_id: doctors_category_id},
    {name: 'Dyspnea', doctors_category_id: doctors_category_id},
    {name: 'Nauses', doctors_category_id: doctors_category_id},
    {name: 'Loss of Consciousness', doctors_category_id: doctors_category_id}
]

diseases_categories.each do |category|
  diseases_category = DiseasesCategory.find_by_name(category[:name])
  DiseasesCategory.create(category) unless diseases_category
end


doctors = [
    {name: 'Will Smith', doctors_category_id:doctors_category_id, address: '740 Teall Ave,Syracuse, NY 13206, USA'},
    {name: 'Mike Thompson', doctors_category_id:doctors_category_id, address: '15 Sudbury St,Boston, MA 02203, USA'},
    {name: 'Chuck Norris', doctors_category_id:doctors_category_id, address: '422 W 2nd St,Grand Island, NE 68801, USA'}
]

doctors.each do |doctor|
    current_doctor = Doctor.find_by_name(doctor[:name])
    Doctor.create(doctor) unless current_doctor
end