class Entry < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :journal_entry
end
