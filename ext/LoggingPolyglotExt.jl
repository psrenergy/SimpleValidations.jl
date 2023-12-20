module LoggingPolyglotExt

using SimpleValidations, LoggingPolyglot

function SimpleValidations.validation_error(;
    collection::String = "",
    attribute::String = "",
    identifier::Union{String, Real} = "",
    message,
)
    if isnothing(message)
        message = "Validation error for attribute '$attribute' in collection '$collection' with identifier '$identifier'"
    end
    @error message
    validation_error =
        SimpleValidations.ValidationError(message, attribute, collection, identifier)
    return SimpleValidations._add_error(validation_error)
end

end
