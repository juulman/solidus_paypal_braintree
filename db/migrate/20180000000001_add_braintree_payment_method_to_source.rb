class AddBraintreePaymentMethodToSource < SolidusSupport::Migration[4.2]
  def self.up
    add_reference :solidus_paypal_braintree_sources, :braintree_payment_method, :polymorphic => true, index: true
  end

  def self.down
    remove_reference :solidus_paypal_braintree_sources, :braintree_payment_method
  end
end
