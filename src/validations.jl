

num_validation_errors() = length(VALIDATIONS)
has_validation_errors() = num_validation_errors() > 0

function _add_error(validation_error::ValidationError)
    push!(VALIDATIONS, validation_error)
end

function init_validations()
    empty!(VALIDATIONS)
end

function validation_error(;
    element_collection::String = "",
    element_name::String = "",
    element_identifier::Union{String,Real} = "",
    message::Union{String,Nothing} = nothing,
)
    if isnothing(message)
        message = "Validation error for element '$element_name' in collection '$element_collection' with identifier '$element_identifier'"
    end
    Log.non_fatal_error(message)
    validation_error =
        ValidationError(message, element_name, element_collection, element_identifier)
    _add_error(validation_error)
end
