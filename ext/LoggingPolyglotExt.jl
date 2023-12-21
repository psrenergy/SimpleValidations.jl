module LoggingPolyglotExt

using SimpleValidations, LoggingPolyglot

function SimpleValidations.validation_error(;
    collection::String = "",
    attribute::String = "",
    identifier::Union{String, Real} = "",
    message::Union{Tuple},
)
    separated_messages = vcat(message...)
    polyglot_message =
        LoggingPolyglot.prepare_msg(separated_messages[1], separated_messages[2:end]...)
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
