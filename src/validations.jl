

num_errors(validation::DataBaseValidation) = validation.num_errors

function _add_error(validation_error::ValidationError)
    VALIDATIONS.num_errors += 1
    push!(VALIDATIONS.errors_list, validation_error)
end

function validation_error(element_collection::String, element_name::String, element_identifier::Union{String, Real}, value::Real, constraint::LessThanValidation, message::Union{String, Nothing} = nothing)
    if isnothing(message)
        message = "$(element_name) is less than $(constraint.limit)."
    end
    if value < constraint.limit
        Log.non_fatal_error(message)
        validation_error = ValidationError(message, constraint, element_name, element_collection, element_identifier)
        _add_error(validation_error)
    end
end
validation_error(element_name::String, value::Real, constraint::LessThanValidation, message::Union{String, Nothing} = nothing) = validation_error("", element_name, "", value, constraint, message)

function validation_error(element_collection::String, element_name::String, element_identifier::Union{String, Real}, value::Real, constraint::GreaterThanValidation, message::Union{String, Nothing} = nothing)
    if isnothing(message)
        message = "$(element_name) is greater than $(constraint.limit)."
    end
    if value > limit.limit
        Log.non_fatal_error(message)
        validation_error = ValidationError(message, constraint, element_name, element_collection, element_identifier)
        _add_error(validation_error)
    end
end
validation_error(element_name::String, value::Real, constraint::GreaterThanValidation, message::Union{String, Nothing} = nothing) = validation_error("", element_name, "", value, constraint, message)

function validation_error(element_collection::String, element_name::String, element_identifier::Union{String, Real}, value::Real, constraint::EqualToValidation, message::Union{String, Nothing} = nothing)
    if isnothing(message)
        message = "$(element_name) is equal to $(constraint.limit)."
    end
    if value == constraint.limit
        Log.non_fatal_error(message)
        validation_error = ValidationError(message, constraint, element_name, element_collection, element_identifier)
        _add_error(validation_error)
    end
end
validation_error(element_name::String, value::Real, constraint::EqualToValidation, message::Union{String, Nothing} = nothing) = validation_error("", element_name, "", value, constraint, message)

function validation_error(element_collection::String, element_name::String, element_identifier::Union{String, Real}, value::Real, constraint::NotEqualToValidation, message::Union{String, Nothing} = nothing)
    if isnothing(message)
        message = "$(element_name) is not equal to $(constraint.limit)."
    end
    if value != constraint.limit
        Log.non_fatal_error(message)
        validation_error = ValidationError(message, constraint, element_name, element_collection, element_identifier)
        _add_error(validation_error)
    end
end

function validation_error(element_collection::String, element_name::String, element_identifier::Union{String, Real}, value::Real, constraint::InRangeValidation, message::Union{String, Nothing} = nothing)
    if isnothing(message)
        message = "$(element_name) is not in range $(constraint.lower_limit) to $(constraint.upper_limit)."
    end
    if value < constraint.lower_limit || value > constraint.upper_limit
        Log.non_fatal_error(message)
        validation_error = ValidationError(message, constraint, element_name, element_collection, element_identifier)
        _add_error(validation_error)
    end
end