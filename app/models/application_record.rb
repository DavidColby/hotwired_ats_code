class ApplicationRecord < ActiveRecord::Base
  include CableReady::Updatable

  primary_abstract_class
  self.implicit_order_column = 'created_at'
end
