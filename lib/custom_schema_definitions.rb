module ActiveRecord #:nodoc:
  module ConnectionAdapters #:nodoc:
    class TableDefinition
      # Adds trst specific  columns t.trst in create_table
      def trsts
        column(:created_on, :datetime)
        column(:created_by, :integer , :limit => 6, :default => 0, :null => false)
        column(:updated_on, :datetime)
        column(:updated_by, :integer , :limit => 6, :default => 0, :null => false)
        column(:approved_by, :integer , :limit => 6, :default => 0, :null => false)
      end
    end
  end
end