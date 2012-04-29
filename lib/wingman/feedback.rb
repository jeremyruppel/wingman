module Wingman
  class Feedback < Struct.new( :email, :comment, *Wingman.stats.keys )
    def initialize( attributes={} )
      attributes.each do |key, value|
        self.send :"#{key}=", value
      end
    end

    include ActiveModel::Validations

    validates :email,   :presence => true
    validates :comment, :presence => true
  end
end
