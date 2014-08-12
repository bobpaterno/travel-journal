RSpec.describe "View Landmarks Integration", :integration do
  context "no existing locations" do
    let(:output){ run_travel_with_input("view", "2") }
    it "indicates that landmarks exist" do
      expected = "No landmarks exist"
      expect(output).to include(expected)
    end
  end

  context "existing locations" do
    let!(:location1){ Location.create(city: "London", country: "UK", lat: "0", long: "0") }
    let!(:location2){ Location.create(city: "New Orleans", country: "USA", lat: "1", long: "1") }
    let!(:location3){ Location.create(city: "Paris", country: "France", lat: "2", long: "2") }
    let!(:landmark1){ Landmark.create(name: "Louvre")}
    let(:output){ run_travel_with_input("view", "2") }
    it "prompts the user to list all or by location" do
      expected = "1. See all landmarks\n2. By location\n"
      expect(output).to include(expected)
    end
  end

end
