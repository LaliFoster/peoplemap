class Person

  include Neo4j::NodeMixin

  property :title, :first_name, :middle_names, :surname, :maternal_name, :date_of_birth, :classification, :sex, :notes
  
  has_n(:person_to_person).to(Person).relationship(Role)
  has_n(:person_to_org).to(Organisation).relationship(Role)
  has_n(:person_to_event).to(Event).relationship(Role)
  has_n(:person_to_loc).to(Location).relationship(Role)
  has_n(:person_to_ref).to(Reference).relationship(Role)
  
  index :surname, :first_name, :classification

  Person::TITLE_TYPES = [
    ["Mr", "Mr"],
    ["Mrs", "Mrs"],
    ["Ms", "Ms"],
    ["Miss", "Miss"],
    ["Master", "Master"]
  ]
  
  Person::SEXES = [
    ["Male","Male"],
    ["Female","Female"]
  ]
  
end