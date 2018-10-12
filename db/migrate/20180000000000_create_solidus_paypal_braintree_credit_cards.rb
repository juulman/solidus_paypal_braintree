class CreateSolidusPaypalBraintreeCreditCards < SolidusSupport::Migration[4.2]
  def change
    create_table :solidus_paypal_braintree_credit_cards do |t|
      t.string :card_type
      t.string :expiration_month
      t.string :expiration_year
      t.string :cardholder_name
      t.string :last_4
      t.timestamps
    end
  end
end
