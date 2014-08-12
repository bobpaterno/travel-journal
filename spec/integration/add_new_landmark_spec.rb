RSpec.describe "Create Landmarks Integration", :integration do
  context "valid input" do
    context "no existing locations" do
      let(:output){ run_travel_with_input("new", "2") }
      it "indicates that user must first create a location" do
        expected = "You must first create a new location for the landmark"
        expect(output).to include(expected)
      end
    end

    context "existing locations" do
      let!(:location1){ Location.create(city: "London", country: "UK", lat: "0", long: "0") }
      let!(:location2){ Location.create(city: "New Orleans", country: "USA", lat: "1", long: "1") }
      let!(:location3){ Location.create(city: "Paris", country: "France", lat: "2", long: "2") }

      context "prompt to choose landmark location" do
        let(:output){ run_travel_with_input("new", "2") }
        it "should prompt user to select from a list of locations" do
          expected = "In what city is your landmark?"
          expect(output).to include(expected)
        end

        it "should list correct locations to choose from" do
          expected = "1. London\n2. New Orleans\n3. Paris\n"
          expect(output).to include(expected)
        end
      end

      context "prompt to enter landmark" do
        let(:output){ run_travel_with_input("new", "2", "2") }
        it "should prompt the user to enter a landmark name" do
          expected = "Enter the name of the landmark"
          expect(output).to include(expected)
        end
      end

      context "creates a new landmark record" do
        let!(:output){ run_travel_with_input("new", "2", "1", "Big Ben") }
        it "should save a landmark record to the database" do
          expect(Landmark.last.name).to eq("Big Ben")
          expect(Landmark.count).to eq 1
        end
      end

      context "checks landmark's location_id is correct location" do
        let!(:landmark){ Landmark.create(name: "Louvre", location_id: location3.id) }
        it "checks if location id is properly referenced in landmark table" do
          expect(landmark.location_id).to eq location3.id
        end
      end

      context "checks landmark's location_id is correct in application" do
        let!(:output){ run_travel_with_input("new", "2", "1", "Big Ben") }
        it "checks if location id is properly referenced in landmark table" do
          landmark = Landmark.all.last
          expect(landmark.location_id).to eq location1.id
        end
      end
    end
  end

  context "invalid input" do
    let!(:location1){ Location.create(city: "London", country: "UK", lat: "0", long: "0") }
    let!(:location2){ Location.create(city: "New Orleans", country: "USA", lat: "1", long: "1") }
    let!(:location3){ Location.create(city: "Paris", country: "France", lat: "2", long: "2") }
    context "empty name" do
      let!(:output){ run_travel_with_input("new","2","2","")}
      it "should not create a new landmark record" do
        expect(Landmark.count).to eq 0
      end
    end

    context "location selection does not exist" do
      let!(:output){ run_travel_with_input("new","2","5","doesn't matter") }
      it "should not create a new landmark record" do
        expect(Landmark.count).to eq 0
      end
    end
  end
end
