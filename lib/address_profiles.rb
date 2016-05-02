require "address_profiles/version"

module AddressProfiles
  # This will be executed in the ability class, by defalut, if the Feature is enabled.
  # May need to expand permissions later, current needs are pretty loose, any user can edit/join any address profile
  class Default
    def self.permissions
      [
        "can_manage_address_profiles"
      ]
    end
  end

  class AddressProfilesFeatureDefinition
    include FeatureSystem::Provides
    def permissions
      []
    end
  end

  module Authorization
    module Permissions

      def can_manage_address_profiles
        can :manage, FormResponse, responsable_type: "Address"
      end

    end
  end

end

require 'address_profiles/railtie' if defined?(Rails)
