RSpec.describe TreeController do
  let(:body) { {"color":"green","location":"unknown","type":"martian","weight":"light"}.to_json }

  context 'base controller test' do
    before do
      Behavior.create(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
    end

    it 'must valid' do
      # binding.pry
      post '/build_tree_v1', body, headers: {'CONTENT_TYPE' => 'application/json'}
      # binding.pry
      expect(last_response.body).to eq('{"json":{"result":{"key":"color","values":{"green":{"key":"location","values":{"unknown":{"key":"type","values":{"martian":[11]}}}}}}}}')
      # expect_status 200
      # expect_json_types(result: :array)
      # expect(json_body.to_json).to eq('{"result":[{"product_id":"pv0","description":null,"strategy":"increase_loan_period","id":"increase_loan_period","vehicle_price":650000.0,"equipment":0.0,"insurance":0.0,"initial_payment":0.0,"loan_amount":650000.0,"loan_period":1,"rate":0.1725,"irr":0.1725,"monthly_payment":659344,"residual_payment":0,"overpayment":9344,"active":false,"errors":{"period":["Срок кредита не может быть меньше 24 месяцев"]},"percentage":"17.25%","wo_kasko_insurance_rate":0.1725,"kasko_percentage":"0.50%","life_percentage":"0.00%","gos_percentage":"6.70%","gos_subsidized_amount":"","vehicle_invoice_amount":650000.0,"title":"Запрошенные условия"},{"product_id":"pv0","description":null,"strategy":"decrease_initial_payment","id":"decrease_initial_payment","vehicle_price":650000.0,"equipment":0.0,"insurance":0.0,"initial_payment":0.0,"loan_amount":650000.0,"loan_period":84,"rate":0.1725,"irr":0.1725,"monthly_payment":13377,"residual_payment":0,"overpayment":473698,"active":true,"errors":{},"percentage":"17.25%","wo_kasko_insurance_rate":0.1725,"kasko_percentage":"0.50%","life_percentage":"0.00%","gos_percentage":"6.70%","gos_subsidized_amount":"","vehicle_invoice_amount":650000.0,"title":"Уменьшенный ПВ"},{"product_id":"pv0","description":null,"strategy":"mean_loan_period","id":"mean_loan_period","vehicle_price":650000.0,"equipment":0.0,"insurance":0.0,"initial_payment":0.0,"loan_amount":650000.0,"loan_period":84,"rate":0.1725,"irr":0.1725,"monthly_payment":13377,"residual_payment":0,"overpayment":473698,"active":true,"errors":{},"percentage":"17.25%","wo_kasko_insurance_rate":0.1725,"kasko_percentage":"0.50%","life_percentage":"0.00%","gos_percentage":"6.70%","gos_subsidized_amount":"","vehicle_invoice_amount":650000.0,"title":"Увеличенный срок"}]}')
    end
  end

end
