RSpec.describe Location do
  context "validations" do
    it { should validate_presence_of :city }
    it { should validate_presence_of :country }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :long }
    it { should ensure_length_of :lat }
    it { should ensure_length_of :long }
  end
end
