class EmployeeMailer < ApplicationMailer
  default from: 'Payslip'
  layout 'mailer'

  def send_pdf_email(email = nil, salary = nil, pdf = nil)
    @email = email
    @salary = salary
    attachments['payslip.pdf'] = pdf.to_pdf
    mail(to: @email, subject: 'welcome to payslip.')
  end
end