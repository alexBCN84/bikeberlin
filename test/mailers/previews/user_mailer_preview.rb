# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("john@example.com", "John", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum condimentum quam a sodales. Nullam viverra ultrices ornare. Fusce vel lobortis enim, sed rutrum sapien. Nunc urna elit, sollicitudin ac diam quis, efficitur molestie sapien. Curabitur posuere urna magna, sed sodales turpis pulvinar quis. Donec ac vestibulum quam, non aliquam mauris. Pellentesque aliquam elit a mattis tincidunt. Phasellus quam sapien, pulvinar nec odio in, malesuada imperdiet elit. Aliquam sit amet sem gravida, accumsan libero nec, imperdiet purus. Vivamus eget sem vel lacus condimentum lobortis. Morbi nibh tellus, facilisis id ipsum ac, posuere tempus enim.")
  end
end
