class EnquiriesController < ApplicationController
  
  include YmEnquiries::EnquiriesController
  load_and_authorize_resource

  def index
    @enquiries = Enquiry.order('created_at DESC')
    # @enquiries = Enquiry.for_year('2013').order('created_at DESC')
    respond_to do |format|
      format.html
      format.xls do
        headers["Content-Disposition"] = "attachment; filename=\"unseen-press-accreditations.xls\""
      end
    end
  end

  def legitimation
    enquiry = Enquiry.find(params[:id])
    send_file(enquiry.legitimation.try(:path), :filename => "#{enquiry.full_name.parameterize}.#{enquiry.legitimation.try(:ext)}")
  end
  
end