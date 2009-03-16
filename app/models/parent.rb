#TODO Test, Populate, Populate at start
#TODO - offset
#TODO - limit
#TODO - sort order
#TODO - compare to base app
class Parent < ConceptSpace::ActiveRecordLike::CacheBase
  belongs_to :parent
  has_many :offsprings, :class_name=>'Parent'
  has_many :properties
  
  column :id, :string
  column :name, :string, '', false
  column :parent_id, :string
end
