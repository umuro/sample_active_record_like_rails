#TODO refactor
require 'test_helper'
require 'ConceptSpace::ActiveRecordLike::CacheBaseTest'.underscore

class ParentTest < ConceptSpace::ActiveRecordLike::CacheBaseTest
  
  def model_class
    Parent if self.class == ParentTest
  end
  
  def model_instance
    Factory.build(:parent)
  end
  
  def model_attribute_to_update
    [:name, "new name"]
  end
  
  context "New Parent" do
    setup do
      @new_parent = model_instance
    end
    
    should "have attributes" do  
      [:name, :parent, :offsprings].each { |message| assert_respond_to @new_parent, message }
    end
  end #context "New Parent"
end #class ParentTest