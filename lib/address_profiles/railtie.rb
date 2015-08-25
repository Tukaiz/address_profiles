module AddressProfiles
  class Railtie < Rails::Railtie

    initializer "my_railtie.configure_rails_initialization" do |app|
      FeatureBase.register(app, AddressProfiles)
    end

    config.after_initialize do
      FeatureBase.inject_feature_record("AddressProfiles",
        "AddressProfiles",
        "Allows a site to add profiles to an address.",
        ["FeatureSiteAddressBook"]
      )
      FeatureBase.inject_permission_records(
        AddressProfiles,
        AddressProfilesFeatureDefinition.new.permissions
      )
    end

  end
end

