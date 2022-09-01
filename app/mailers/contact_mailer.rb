class ContactMailer < ApplicationMailer

  default to: "wematchjs@gmail.com"
  default from: "abrahamezg@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.home_form.subject
  #
  def home_form(name, email, message)
    @name = name
    @email = email
    @message = message

    mail subject: 'Contact form'
  end
end
