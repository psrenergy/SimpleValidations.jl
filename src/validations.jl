
num_validation_errors() = length(VALIDATIONS)
has_validation_errors() = num_validation_errors() > 0

function _add_error(validation_error::ValidationError)
    return push!(VALIDATIONS, validation_error)
end

function init_validations()
    return empty!(VALIDATIONS)
end

function validation_error(;
    collection::String = "",
    attribute::String = "",
    identifier::Union{String, Real} = "",
    message::Union{String, Nothing} = nothing,
)
    if isnothing(message)
        message = "Validation error for attribute '$attribute' in collection '$collection' with identifier '$identifier'"
    end
    @error message
    validation_error =
        ValidationError(message, attribute, collection, identifier)
    return _add_error(validation_error)
end
