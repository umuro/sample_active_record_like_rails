class Parent < ConceptSpace::ActiveRecordLike::CacheBase
  belongs_to :parent
  has_many :properties

  column :id, :string
  column :name, :string, '', false
end
#NOTE: ActiveScaffold confuses recursive relations. Not our issue.
#TODO: Functional Tests are not working for ActiveScaffold. Revise cs_active_scaffold generator.