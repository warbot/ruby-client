
require "spec_helper"

describe Namely::Model do
  describe '#initialize' do
    it 'does not have id if not given' do
      resource_gateway = double(:resource_gateway)

      model = Namely::Model.new(resource_gateway, {:first_name => 'foob'})

      expect(model.id).to eq nil
    end

    it 'sets the id that was given' do
      resource_gateway = double(:resource_gateway)

      model = Namely::Model.new(resource_gateway, {:id => 1234})

      expect(model.id).to eq 1234
    end
  end
end
