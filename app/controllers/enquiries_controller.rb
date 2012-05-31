class EnquiriesController < ApplicationController
  
  include YmEnquiries::EnquiriesController
  load_and_authorize_resource

  def legitimation
    enquiry = Enquiry.find(params[:id])
    send_file(enquiry.legitimation.try(:path), :filename => "#{enquiry.full_name.parameterize}.#{enquiry.legitimation.try(:ext)}")
  end
  
end