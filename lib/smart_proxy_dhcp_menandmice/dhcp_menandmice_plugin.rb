require 'smart_proxy_dhcp_menandmice/dhcp_menandmice_version'

module Proxy::Dhcp::Menandmice
  class Plugin < ::Proxy::Provider
    plugin :dhcp_menandmice, ::Proxy::Dhcp::Menandmice::VERSION

    # Settings listed under default_settings are required.
    # An exception will be raised if they are initialized with nil values.
    # Settings not listed under default_settings are considered optional and by default have nil value.
    default_settings :server => "127.0.0.1", :username => "username", :password => "password"

    requires :dns, '>= 1.15'

    # Verifies that a file exists and is readable.
    # Uninitialized optional settings will not trigger validation errors.
    validate_readable :required_path, :optional_path

    # Loads plugin files and dependencies
    load_classes ::Proxy::Dhcp::Menandmice::PluginConfiguration
    # Loads plugin dependency injection wirings
    load_dependency_injection_wirings ::Proxy::Dhcp::Menandmice::PluginConfiguration
  end
end
