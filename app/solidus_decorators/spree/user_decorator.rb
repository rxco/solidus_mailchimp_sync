if Spree.user_class
  Spree.user_class.class_eval do
    after_commit :mailchimp_sync

    private
    def mailchimp_sync
      SolidusMailchimpSync::UserSynchronizer.new(self).maybe_sync_after_commit
    end
  end
end
