describe 'Business' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Business entity' do
    Business.entity_description.name.should == 'Business'
  end
end
