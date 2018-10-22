module SolidusPaypalBraintree
  class CreditCard < ApplicationRecord
    has_one :payment_source, as: :braintree_payment_method, class_name: "SolidusPaypalBraintree::Source"
  end
end
