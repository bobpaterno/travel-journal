RSpec.describe "Travel Journal main menu", :integration do
  context "valid input" do
    context "prints a menu with options" do
      let(:output){ run_travel_with_input() }
      it "shows a welcome message" do
        expected = %q{
=================
Welcome Traveler!
=================
}
        expect(output).to include(expected)
      end

      it "prints out the options 'New and View' " do
        expected = "Type: View or New\n"
        expect(output).to include(expected)
      end
    end

    context "top level view menu" do
      let(:output){ run_travel_with_input("View") }
      it "should print top level view menu" do
        expected = "View what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
        expect(output).to include(expected)
      end
    end

    context "view locations" do
      let!(:location1){ Location.create(city: "London", country: "UK", lat: "0", long: "0") }
      let!(:location2){ Location.create(city: "New Orleans", country: "USA", lat: "1", long: "1") }
      let(:output){ run_travel_with_input("view", "1") }
      it "should show a list of all locations in db" do
        expect(output).to include("London")
        expect(output).to include("New Orleans")
      end
    end

    context "show a specific location" do
      let!(:location1){ Location.create(city: "London", country: "UK", lat: "0", long: "0") }
      let!(:location2){ Location.create(city: "New Orleans", country: "USA", lat: "1", long: "1") }
      let(:output){ run_travel_with_input("view", "1", "2") }
      it "should show the New Orleans record" do
        expect(output).to include("New Orleans, USA => Latitude 1  Longitude 1")
      end
    end

    context "prompt user to enter a new location" do
      let(:output){ run_travel_with_input("new", "1") }
      it "should prompt user to enter a new location" do
        expect(output).to include("Enter the city, country, latitude, and longitude separated by commas")
      end
    end

    context "save a new location" do
      let!(:output){ run_travel_with_input("new", "1", "Austin, USA, 21.2, 30.4") }
      it "should save the new record to the database" do
        location = Location.last
        expect(location.city).to eq "Austin"
        expect(location.country).to eq "USA"
        expect(location.lat).to eq "21.2"
        expect(location.long).to eq "30.4"
      end
    end
  end
  context "invalid input" do
    let(:output){ run_travel_with_input("view", "cowabunga") }
    it "should print an error message" do
      expect(output).to include("Sorry, Travel doesn't support that command\n\n")
    end
  end
end
