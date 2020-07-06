class EmployeeMailer < ApplicationMailer
  default from: 'Payslip'
  layout 'mailer'

  def send_pdf_email(email = nil, salary = nil)
    @email = email
    @salary = salary
    # attachments["payslip.pdf"] = PDFKit.new.pdf_from_string(render_to_string( template: 'salaries/show.html.erb',margin: { top: '0', bottom: '0', left: '0', right: '0'}))
    # attachments.inline["get-started.png"] = File.read("#{Rails.root}/app/ assets/images/get-started.png")
    mail(to: @email, subject: 'welcome to payslip.') do |format|
      # format.text => "mailer/send_pdf_email.html.erb"
      format.pdf do
        # attachments['payslip.pdf'] = { render :text => PDFKit.new(salary_url) }
        attachments['payslip.pdf'] = PDFKit.new.pdf_from_string(render_to_string(:template => 'salaries/show.html.erb'))
      end
    end
  end
end