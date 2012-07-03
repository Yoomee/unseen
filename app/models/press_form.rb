module PressForm
  
  include YmEnquiries::EnquiryForm
  
  title "Press accreditation"
  intro "Fill out fields marked with *. Please submit your data as detailed as possible, so we can properly process your accreditation."
  fields :accreditation, :title, :last_name, :first_name, :image_uid, :media, :category, :position, :publication_rhythm, :address1, :zip_code, :town, :country, :phone, :fax, :email, :mobile_phone, :publication_address1, :publication_zip_code, :publication_town, :publication_country, :publication_phone, :publication_fax, :publication_email, :publication_website, :legitimation_uid
  
  validates :accreditation, :title, :last_name, :first_name, :media, :address1, :zip_code, :town, :country, :email, :presence => true
  validates :email, :publication_email, :email => true, :allow_blank => true
  
  email_from "info@unseenamsterdam.com"
  email_subject "New Press accreditation"
  email_to "merel@foam.org, noni@foam.org, rhiannon@picklespr.com, maurice@vandejong.nl"

  response_message "Thank you for submitting your press accreditation"
  
end
  
