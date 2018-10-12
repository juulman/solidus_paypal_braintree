module SolidusPaypalBraintree
  class CreditCard < ApplicationRecord
    has_one :payment_source, as: :braintree_payment_method, class_name: "SolidusPaypalBraintree::Source"

    SPREE_TO_BRAINTREE_CC_ATTRS = {
      name: :cardholder_name,
      last_digits: :last_4,
      month: :expiration_month,
      year: :expiration_year,
      cc_type: :card_type,
    }

    SPREE_TO_BRAINTREE_CC_ATTRS.each do |spree_attr, braintree_attr|
      alias_attribute spree_attr, braintree_attr
    end

    def get_or_fetch(attr)
      return self[attr] if self[attr].present?
      braintree_attr = SPREE_TO_BRAINTREE_CC_ATTRS[self[attr]]
      self.payment_source.braintree_payment_method_fetch[braintree_attr]
    end

    def get_or_fetch!(attr)
      braintree_cc = get_or_fetch(attr)
      args = SPREE_TO_BRAINTREE_CC_ATTRS.values.map{|a_braintree_attr| [ a_braintree_attr, braintree_cc[a_braintree_attr]] }.to_h
      update_attributes(args)
    end
  end
end
