RSpec.describe Landmark do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).with_message("already exists")}
  end

  context "correct location id" do
    let!(:location1){ Location.create(city: "Miami", country: "USA", lat: "0", long: "0") }
    let!(:location2){ Location.create(city: "Nashville", country: "USA", lat: "1", long: "1") }
    let!(:landmark1){ Landmark.create(name: "South Beach", location_id: location1.id)}
    let!(:landmark2){ Landmark.create(name: "Fountain Blue Hotel", location_id: location1.id)}
    let!(:landmark3){ Landmark.create(name: "Titans Stadium", location_id: location2.id)}
    it "should find the location city by landmark" do
      location1_city = landmark1.location.city
      expect(location1_city).to eq "Miami"
    end

    it "should find all landmarks at a location" do
      landmark_list = location1.landmarks
      expect(landmark_list[0].name).to eq "South Beach"
      expect(landmark_list[1].name).to eq "Fountain Blue Hotel"
    end
  end
end
