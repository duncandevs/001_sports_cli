class BookGenre < ActiveRecord::Base

  belongs_to :genre
  belongs_to :book
end

# module ActiveRecord
#
#   class Migration
#   end
#
#   class Base
#
#   end
#
# end
