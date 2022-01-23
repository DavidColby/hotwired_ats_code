class ApplicationMailbox < ActionMailbox::Base
  routing /reply/i => :applicant_replies
end
