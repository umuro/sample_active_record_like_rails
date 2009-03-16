#TODO Property; why factory creates parent_id nil
class Property  < ConceptSpace::ActiveRecordLike::CacheBase
  belongs_to :parent
  
  column :id, :string
  column :parent_id, :string
  column :name, :string
  column :value, :integer
end
