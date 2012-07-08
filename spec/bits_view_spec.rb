describe "The 'bits' view" do
  tests BitsController

  it "should have a status label" do
    view('status_label').should.not.be.nil
  end

  it "should respond to status change :open" do
    controller.view.update_status_label(:open)
    view('status_label').text.should.match(/aperta/)
  end

  it "should respond to status change :closed" do
    controller.view.update_status_label(:closed)
    view('status_label').text.should.match(/chiusa/)
  end
  
  
  
end
