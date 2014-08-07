RSpec.describe "Travel Journal main menu" do
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

    it "prints out the options 'New or View' " do
      expected = "1. New\n2. View\n"
      expect(output).to include(expected)
    end
  end

  context "top level view menu" do
    let(:output){ run_travel_with_input("1") }
    it "should print top level view menu" do
      expected = "View what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
      expect(output).to include(expected)
    end
  end

  context "view locations" do
    let!(:location1){ Location.create(city: "London", country: "UK", lat: "0", long: "0") }
    let!(:location2){ Location.create(city: "New Orleans", country: "USA", lat: "1", long: "1") }
    let(:output){ run_travel_with_input("1", "1") }
    it "should show a list of all locations in db" do
      pending "implementation of controllers and router"
      expect(output).to include("London")
      expect(output).to include("New Orleans")
    end
  end
end

