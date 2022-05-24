class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    new_query = '%' + query + '%' if !query.nil?
    if new_query
      self.all.where("name like ?", new_query)
    else
      self.all
    end
  end
  
end
