RSpec.describe "Router model", :integration do
  context "Input path - view" do
    context "view path menu" do
      let(:output){ run_travel_with_input("view") }
      it "should output location, landmark, and entry options" do
        expected = "View what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
        expect(output).to include(expected)
      end
    end
  end

  context "Input path - new" do
    context "new path menu" do
      let(:output){ run_travel_with_input("new") }
      it "should output location, landmark, and entry options" do
        expected = "New what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
        expect(output).to include(expected)
      end
    end
  end

  context "invalid command" do
    let(:output){ run_travel_with_input("goober") }
    it "should inform user that command is not supported" do
      expected = "Sorry, Travel doesn't support that command\n\n"
      expect(output).to include(expected)
    end
  end
end
