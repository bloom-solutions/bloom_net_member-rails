class ApplicationCell < Trailblazer::Cell

  # Global exceptions to the helpers included, because form helpers expect these
  # to be available in the context.
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::RecordIdentifier
  include SimpleForm::ActionViewExtensions::FormHelper

  HELPERS = [
    ActionDispatch::Routing::PolymorphicRoutes,
    ActionView::Helpers::FormHelper,
    ActionView::Helpers::FormOptionsHelper,
    ActionView::Helpers::NumberHelper,
    ActionView::Helpers::TranslationHelper,
    ActionView::Helpers::UrlHelper,
    ActionView::RecordIdentifier,
    ApplicationHelper,
    SimpleForm::ActionViewExtensions::FormHelper,
    FontAwesome::Rails::IconHelper,
  ]

  def helper
    return @helper if @helper
    @helper = Object.new
    HELPERS.each { |helper_module| @helper.extend(helper_module) }
    @helper
  end
  alias_method :h, :helper

end
