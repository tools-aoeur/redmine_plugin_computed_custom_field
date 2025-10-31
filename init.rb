require 'redmine'

require_relative 'lib/computed_custom_field'
require_relative 'lib/computed_custom_field/custom_field_patch'
require_relative 'lib/computed_custom_field/custom_fields_helper_patch'
require_relative 'lib/computed_custom_field/model_patch'
require_relative 'lib/computed_custom_field/issue_patch'
require_relative 'lib/computed_custom_field/hooks'

Redmine::Plugin.register :computed_custom_field do
  name 'Computed custom field'
  author 'Yakov Annikov (orig)'
  author_url 'https://github.com/tools-aoeur'
  description 'Allows creating custom fields with computed values based on formulas'
  url 'https://github.com/tools-aoeur/redmine_computed_custom_field.git'
  version '6.1.0'

  requires_redmine version_or_higher: '6.1'

  settings default: {}
end

RedmineApp::Application.configure do
  config.after_initialize do
    ComputedCustomField.patch_models
  end
end
