module LoggingPolyglotExt

using SimpleValidations, LoggingPolyglot

function SimpleValidations.validation_error(;
    collection::String = "",
    attribute::String = "",
    identifier::Union{String, Real} = "",
    message::Tuple{Int, Any},
)
    if isnothing(message)
        message = "Validation error for attribute '$attribute' in collection '$collection' with identifier '$identifier'"
    end
    polyglot_message = LoggingPolyglot.prepare_msg(message[1], message[2])
    @error polyglot_message
    validation_error =
        SimpleValidations.ValidationError(
            polyglot_message,
            attribute,
            collection,
            identifier,
        )
    return SimpleValidations._add_error(validation_error)
end

end
