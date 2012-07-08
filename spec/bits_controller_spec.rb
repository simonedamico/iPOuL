describe "The Bits Controller" do
  tests BitsController

  it "should change status label when update_status is called" do
    wait_for_change controller.view.status_label, 'text' do
      controller.view.status_label.text.should.match(/(aperta|chiusa|indefinito)/)
    end
        
  end
  
end
