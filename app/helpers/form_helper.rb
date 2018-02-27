module FormHelper
  def form_errors_for(object)
    return if object.errors.blank?
    render('shared/form_errors', object: object)
  end
end