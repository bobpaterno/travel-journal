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
      expected = "New or View"
      expect(output).to include(expected)
    end
  end

end
