RSpec.describe "Create Journal Entry Integration", :integration do
  context "no existing locations" do
    let(:output){ run_travel_with_input("new", "3") }
    it "indicates that user must first create a location" do
      expected = "You must first create at least one location to make a journal entry"
      expect(output).to include(expected)
    end

    it "prompts the user to create a new location" do
      expected = "Perhaps you'd like to create a new location?"
      expect(output).to include(expected)
    end
  end

  context "existing locations" do
    let!(:location1){ Location.create(city: "Miami", country: "UK", lat: "0", long: "0") }
    let!(:location2){ Location.create(city: "New York", country: "USA", lat: "1", long: "1") }
    let!(:location3){ Location.create(city: "LA", country: "USA", lat: "2", long: "2") }

    context "prompt to choose location" do
      let(:output){ run_travel_with_input("new", "3") }
      it "should prompt user to select from a list of locations" do
        expected = "In what location is your journal entry?"
        expect(output).to include(expected)
      end

      it "should show a list of locations" do
        expected = "1. Miami\n2. New York\n3. LA\n"
        expect(output).to include(expected)
      end
    end

    context "user selects a city" do
      let(:output){ run_travel_with_input("new", "3", "2") }
      it "should prompt the user to begin their journal entry" do
        expected = "Type your journal entry below:\n"
        expect(output).to include(expected)
      end
    end
  end

end
