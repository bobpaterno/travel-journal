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
    let!(:landmark1){ Landmark.create(name: "Louvre", location_id: location3.id) }
    let!(:landmark2){ Landmark.create(name: "French Quarter", location_id: location2.id) }
    let!(:landmark3){ Landmark.create(name: "Notre Dame", location_id: location3.id) }

    context "prompts user to list all or view by location" do
      let(:output){ run_travel_with_input("view", "2") }
      it "prompts the user to list all or by location" do
        expected = "1. See all landmarks\n2. By location\n"
        expect(output).to include(expected)
      end
    end
    context "shows a list of all landmarks" do
      let(:output){ run_travel_with_input("view", "2","1") }
      it "outputs a list of all locations" do
        expected = "  (1)  Louvre - Paris, France\n  (2)  French Quarter - New Orleans"
        expect(output).to include(expected)
      end
    end
    context "shows a list of locations" do
      let(:output){ run_travel_with_input("view", "2","2") }
      it "outputs a list of all locations" do
        expected = "1. London\n2. New Orleans\n3. Paris"
        expect(output).to include(expected)
      end
    end
    context "shows a list of landmarks at a location" do
      let(:output){ run_travel_with_input("view", "2", "2", "3") }
      it "outputs a list of all locations" do
        expected = "  (1)  Louvre - Paris, France\n  (2)  Notre Dame - Paris, France"
        expect(output).to include(expected)
      end
    end


  end

end
