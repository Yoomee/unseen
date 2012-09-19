require 'csv'
desc "Export press enquiries to CSV"
task :press_csv => :environment do
  CSV.open("press.csv", "wb") do |csv|
    csv << PRESS_ENQUIRY_FIELDS.collect(&:first)
    Enquiry.where(:form_name => 'press').each do |enquiry|
      row = []
      PRESS_ENQUIRY_FIELDS.each do |field|
        if field.first == "Sent on"
          row << enquiry.created_at.to_s(:date_and_time)
        else
          row << enquiry.send(field.last)
        end
      end
      csv << row
    end
  end
end

PRESS_ENQUIRY_FIELDS = [
  ["Accreditation", "accreditation"],
  ["Title", "title"],
  ["First name", "first_name"],
  ["Last name", "last_name"],
  ["Media", "media"],
  ["Category", "category"],
  ["Position", "position"],
  ["Publication rhythm", "publication_rhythm"],
  ["Address1", "address1"],
  ["Zip code", "zip_code"],
  ["Town", "town"],
  ["Country", "country"],
  ["Phone", "phone"],
  ["Fax", "fax"],
  ["Email", "email"],
  ["Mobile phone", "mobile_phone"],
  ["Publication address1", "publication_address1"],
  ["Publication zip code", "publication_zip_code"],
  ["Publication town", "publication_town"],
  ["Publication country", "publication_country"],
  ["Publication phone", "publication_phone"],
  ["Publication fax", "publication_fax"],
  ["Publication email", "publication_email"],
  ["Publication website", "publication_website"],
  ["Sent on", "created_at"]
] 
