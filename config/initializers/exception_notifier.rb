Unseen::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Unseen] ",
  :sender_address => %{"notifier <notifier@unseen.com>"},
  :exception_recipients => %w{developers@yoomee.com}