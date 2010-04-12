require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "the base response" do
  describe "on a successful response" do
    before(:each) do
      @hash = Crack::XML.parse(load_canned_response('successful_iowp_response.xml'))
    end
    
    it "should provide the success data hash" do
      response = GlobalCollect::Responses::Base.new(@hash)
      response.extend(GlobalCollect::Responses::SuccessRow)
      response.success_data.should be_a Hash
      response.success_data.should_not be_blank
    end
  end
  
  describe "on an unsuccessful response" do
    before(:each) do
      @hash = Crack::XML.parse(load_canned_response('unsuccessful_iowp_response.xml'))
    end

    it "should not provide the success data hash" do
      response = GlobalCollect::Responses::Base.new(@hash)
      response.extend(GlobalCollect::Responses::SuccessRow)
      response.success_data.should be_nil
    end
  end
end