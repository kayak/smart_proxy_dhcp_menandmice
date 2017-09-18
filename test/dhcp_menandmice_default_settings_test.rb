require 'test_helper'
require 'smart_proxy_dhcp_menandmice/dhcp_menandmice_configuration'
require 'smart_proxy_dhcp_menandmice/dhcp_menandmice_plugin'

class DhcpMenandmiceDefaultSettingsTest < Test::Unit::TestCase
  def test_default_settings
    Proxy::Dns::DhcpMenandmice::Plugin.load_test_settings({})
    assert_equal "default_value", Proxy::Dns::DhcpMenandmice::Plugin.settings.required_setting
    assert_equal "/must/exist", Proxy::Dns::DhcpMenandmice::Plugin.settings.required_path
  end
end
