module ApiErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: :handle_general_error
  end

  protected

  def log_exception(exception)
    trace = exception.backtrace
      .then { |t| exception.class.module_parent == Err ? t.first(8) : t }
      .map! { |t| "  #{t}\n" }
    logger.error "\n#{exception.class.name} (#{exception.message}):\n#{trace.join}"
  end

  private

  def handle_general_error(exception)
    status = exception.instance_of?(Err::CustomException) ? exception.status : 500
    log_exception(exception)
    render json: { error: exception.message }, status: status
  end
end
