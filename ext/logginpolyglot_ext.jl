module LoggingPolyglotExt

    using SimpleValidations, LoggingPolyglot

    struct LoggingPolyglotMessage
        message::String
        function LoggingPolyglotMessage(code::Integer, replacements...)
            new(
                LoggingPolyglot.prepare_msg(code, replacements...)
            )
        end
    end

    function SimpleValidations.validation_error(;
        collection::String = "",
        attribute::String = "",
        identifier::Union{String, Real} = "",
        message::LoggingPolyglotMessage,
    )
        if isnothing(message)
            message = "Validation error for attribute '$attribute' in collection '$collection' with identifier '$identifier'"
        end
        @error message
        validation_error =
            ValidationError(message, attribute, collection, identifier)
        return _add_error(validation_error)
    end

end