RSpec.describe "View Journal Entries Integration", :integration do
  context "no existing entries" do
    let(:output){ run_travel_with_input("view", "3") }
    it "indicates that no entries exist" do
      expected = "Sorry, no journal entries exist"
      expect(output).to include(expected)
    end
  end

  context "existing entries" do
    let!(:location1){ Location.create(city: "Delta Quadrant", country: "Enterprise", lat: "0", long: "0") }
    let!(:location2){ Location.create(city: "Paris", country: "France", lat: "1", long: "1") }
    let!(:location3){ Location.create(city: "LA", country: "USA", lat: "2", long: "2") }
    let!(:entry1) { Entry.create(journal_entry: "This is entry1", location_id: location1.id) }
    let!(:entry2) { Entry.create(journal_entry: "This is entry2", location_id: location2.id) }

    context "journal entry menu selection" do
      let(:output){ run_travel_with_input("view", "3") }
      it "should prompt user to select how to view entries" do
        expected = "1. Select all\n2. Select by location"
        expect(output).to include(expected)
      end
    end


    context "view all entries" do
      let(:output){ run_travel_with_input("view", "3", "1") }
      it "should show all journal entries" do
        expected = %q{
1. Delta Quadrant, Enterprise

This is entry1

2. Paris, France

This is entry2
}
        expect(output).to include(expected)
      end
    end

    context "Entries by location" do
      context "print menu of locations" do
        let(:output){ run_travel_with_input("view", "3", "2") }
        it "should show a list of locations to select" do
          skip "will implement this feature later"

          expected = "1. Delta Quadrant, Enterprise\n2. Paris, France\n"
          expect(output).to include(expected)
        end
        it "should not show a list of locations without journal entries" do
          skip "will implement this feature later"

          expected = "LA, USA\n"
          expect(output).not_to include(expected)
        end
      end
    end

  end
end
