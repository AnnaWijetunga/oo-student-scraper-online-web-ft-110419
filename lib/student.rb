class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
      # use meta-programming to assign the newly created student attributes and values per the key/value pairs of the hash
    end
    @@all << self # add the newly created student to the student class' @@all array of all students 
  end

  def self.create_from_collection(students_array)
    students_array.each do |student_hash|
      Student.new(student_hash)
    end
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    # iterate over given hash
    # use meta-programming to dynamically assign the student attributes and values per the key/value pairs of the hash 
    self # return value should be the student 
  end

  def self.all
    @@all 
  end
end

