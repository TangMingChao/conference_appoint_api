module SimpleTokenAuthentication
  module TokenAuthenticationHandler

    alias_method :integrate_with_devise_case_insensitive_keys_origin, :integrate_with_devise_case_insensitive_keys

    # Private: Take benefit from Devise case-insensitive keys
    #
    # See https://github.com/plataformatec/devise/blob/v3.4.1/lib/generators/templates/devise.rb#L45-L48
    #
    # identifier_value - the original identifier_value String+    #
    # Returns an identifier String value which case follows the Devise case-insensitive keys policy
    def integrate_with_devise_case_insensitive_keys(identifier_value, entity)
      integrate_with_devise_case_insensitive_keys_origin identifier_value.dup, entity
    end
  end
end
