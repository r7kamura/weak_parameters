module WeakParameters
  class BaseValidator
    attr_reader :controller, :options, :block

    def initialize(controller, key, options = {}, &block)
      @controller = controller
      @key = key
      @options = options
      @block = block
    end

    def validate(*path)
      @path = path
      handle_failure unless valid?
    end

    def required?
      !!options[:required]
    end

    def type
      self.class.name.split("::").last.sub(/Validator$/, "").underscore.to_sym
    end

    def key
      path[-1]
    end

    private

    def valid?
      case
      when required? && nil?
        false
      when exist? && invalid_type?
        false
      when exist? && exceptional?
        false
      when exist? && block && !block.call(value)
        false
      else
        true
      end
    end

    def nil?
      value.nil?
    end

    def exist?
      !nil?
    end

    def exceptional?
      case
      when options[:only].try(:exclude?, value)
        true
      when options[:except].try(:include?, value)
        true
      else
        false
      end
    end

    # key array to validation target
    def path
      # Because @key becomes nil at ListValidator, I remove it from path.
      (@path + [ @key ]).compact
    end

    def params
      path[0...-1].inject(controller.params) { |params, key|
        params[key]
      }
    end

    def value
      params[key]
    end

    def handle_failure
      if has_handler?
        controller.send(options[:handler])
      else
        raise_error
      end
    end

    def raise_error
      raise WeakParameters::ValidationError, error_message
    end

    def error_message
      "params[#{key.inspect}] must be a valid value"
    end

    def valid_type?
      true
    end

    def invalid_type?
      !valid_type?
    end

    def has_handler?
      !!options[:handler]
    end
  end
end
