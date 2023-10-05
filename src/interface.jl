abstract type AbstractValidation end

struct LessThanValidation <: AbstractValidation
    limit::Real
end

struct GreaterThanValidation <: AbstractValidation
    limit::Real
end

struct EqualToValidation <: AbstractValidation
    limit::Real
end

struct NotEqualToValidation <: AbstractValidation
    limit::Real
end

struct InRangeValidation <: AbstractValidation
    lower_limit::Real
    upper_limit::Real
end


struct ValidationError
    message::String
    validation_type::AbstractValidation
    element_name::String
    element_collection::String
    element_identifier::Union{String, Real}
    function ValidationError(message::String, validation_type::AbstractValidation, element_name::String, element_collection::String, element_identifier::Union{String, Real})
        new(message, validation_type, element_name, element_collection, element_identifier)
    end
end

Base.@kwdef mutable struct DataBaseValidation
    errors_list::Vector{ValidationError} = []
    num_errors::Int = 0
end