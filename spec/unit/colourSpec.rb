require_relative '../../app/lib/colour'

describe Colour do
  let(:colour) { described_class.new }
  describe "#return_match_message" do
    it 'happy return message' do
      message = colour.return_match_message("blue","red")
      expect(message).to eq "Rollin' with the homies!"
    end

    it 'sad return message' do
      message = colour.return_match_message("blue","brown")
      expect(message).to eq "Fashion victim alert!!"
    end
  end
end
