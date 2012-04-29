module Wingman
  class Feedback
    include ActiveModel::Validations

    attr_accessor :email, :comment

    validates :email,   :presence => true
    validates :comment, :presence => true
  end
end
